version 18.0
clear all
set more off
set varabbrev off

* Lecture 5, 12 October 2026: automate regressions after Lecture 4.
* Run from the repository root. Work through each numbered section in class.
capture mkdir "output"
capture mkdir "output/logs"
capture log close session05
log using "output/logs/session05.log", name(session05) text replace

use "data/derived/hotel_panel.dta", clear
keep if accommodation_type == "Hotel" & price_per_night <= 1000

* 1. What is an observation? One price quote, not one hotel.
* A hotel can appear in several searches. Quotes from the same hotel need
* not be independent. Clustering by hotel changes standard errors, not the
* OLS coefficients; it permits dependence among quotes from the same hotel.
* This remains a quote-level analysis: hotels with more quotes get more weight.
describe hotel_id price_per_night ln_price distance rating stars city_id weekend
summarize price_per_night ln_price distance rating stars
tabulate city_id
tabulate weekend

* 2. Use the same complete-case eligibility rule as in Lecture 4.
* The cutoffs below intentionally select different subsets of this sample.
generate byte common_sample = ///
    !missing(ln_price, distance, rating, stars, city_id, weekend, hotel_id)
count if common_sample

* 3. Start manually: repeat one model under different price cutoffs.
* These restrictions intentionally change the sample. They select on the
* outcome, so differences in coefficients describe sample sensitivity.
regress ln_price c.distance c.rating c.stars i.city_id i.weekend ///
    if common_sample & price_per_night <= 100, vce(cluster hotel_id)
regress ln_price c.distance c.rating c.stars i.city_id i.weekend ///
    if common_sample & price_per_night <= 200, vce(cluster hotel_id)
regress ln_price c.distance c.rating c.stars i.city_id i.weekend ///
    if common_sample & price_per_night <= 500, vce(cluster hotel_id)

* 4. A local macro stores text. Stata substitutes it before running a command.
* Start with one regression: expand each macro aloud before running the line.
* Run the definitions and the commands using them together. A local created
* in one selected block is not available in a separate Do-file Editor run.
local outcome ln_price
local predictors c.distance c.rating c.stars i.city_id i.weekend

display as text "Outcome: `outcome'"
display as text "Predictors: `predictors'"
regress `outcome' `predictors' if common_sample & price_per_night <= 200, ///
    vce(cluster hotel_id)

* 5. A foreach loop repeats the same commands with one value changing.
* Braces enclose the repeated block. The local cutoff takes each listed value.
* quietly hides the full regression output; the display keeps the key results.
* Read e(N) before another estimation command replaces it. Nothing is dropped.
local cutoffs 100 200 500
foreach cutoff of local cutoffs {
    quietly regress `outcome' `predictors' ///
        if common_sample & price_per_night <= `cutoff', vce(cluster hotel_id)
    display as text "Cutoff EUR `cutoff': quotes = " ///
        as result %8.0f e(N) "   distance b = " %9.4f _b[distance]
}

* Validate one iteration against the corresponding manual regression above.
* Compare N and the distance coefficient, not just whether the code ran.
regress `outcome' `predictors' if common_sample & price_per_night <= 200, ///
    vce(cluster hotel_id)

* Discussion: Which observations leave when the cutoff falls? Why might both
* N and the distance coefficient change? N counts quotes, not unique hotels.
* Next: complete checkpoint 4 (allow 25 minutes).
* Further city loops and custom programs are in optional-programs.do.

log close session05
