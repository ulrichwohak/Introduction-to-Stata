version 18.0
* Use Stata 18's command behaviour, even in a newer Stata version.

* Lecture 5, 12 October 2026: programming basics and reproducible graphics.
* Work from the repository root. Type and run each section together.

* SETUP
* Clear data from memory; files on disk are not deleted.
clear all
* Show results without pausing and require full variable names.
set more off
set varabbrev off
* Create output folders. capture lets us continue if a folder already exists.
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
* Close this named log if open, then record the lesson in a fresh text log.
capture log close session05
log using "output/logs/session05.log", name(session05) text replace
* Load the prepared dataset; no earlier exercise solution is needed.
use "data/derived/hotel_panel.dta", clear
* Keep Hotel quotes, then positive nightly prices of at most EUR 1,000.
keep if accommodation_type == "Hotel"
keep if price_per_night > 0 & price_per_night <= 1000
* Missing numbers are larger than any number in Stata, so <= 1000 excludes them.
* These are sample choices, not claims that more expensive quotes are errors.
* One row is a price quote. Several rows may refer to the same hotel.

* 1. WHY REPEAT THE SAME TEXT?
* Run familiar summaries by hand. Notice that only the variable name changes.
summarize price_per_night
summarize distance
summarize rating
* One summarize command could also accept all three variables. Later we will
* repeat several commands, including a graph and an export, for each city.

* 2. LOCAL MACROS STORE TEXT
* A macro is a named piece of text, not a column in the dataset.
* Local and global are two kinds of macro. Start with a local.
local variable "price_per_night"
* Reference a local with a backtick on the left and an apostrophe on the right.
* Stata substitutes the text price_per_night before running the command.
display "The variable is `variable'"
summarize `variable'
* Before running that line, say the expanded command: summarize price_per_night.

* A local can also hold a number used as part of a command.
local limit 500
* This counts qualifying rows without dropping any observations.
count if price_per_night <= `limit'

* Without =, store the text. With =, calculate the expression first.
local calculation "2 + 2"
local answer = 2 + 2
* The first line prints 2 + 2; the second prints 4.
display "`calculation'"
display "`answer'"

* A local belongs to the current do-file run. It is not saved in the dataset.
* Run its definition and the commands using it in the SAME selected block.
* A separate Do-file Editor run has a new local scope. An undefined local
* expands to empty text, which can produce an error or an unintended command.

* 3. GLOBAL MACROS HAVE A WIDER SCOPE
* A global is available across do-file runs until removed or Stata closes.
* Use a distinctive name so this demonstration does not overwrite other work.
global session05_demo_unit "EUR per night"
* A dollar sign references a global; braces separate its name from nearby text.
display "The price unit is ${session05_demo_unit}"
* Remove only this demonstration global. Prefer locals for today's own code.
macro drop session05_demo_unit
* Globals can be changed by other do-files, creating hidden dependencies.

* 4. FOREACH REPEATS COMMANDS FOR ITEMS IN A LIST
* of varlist checks that these variable names exist.
* The loop sets the local variable to each name in turn.
foreach variable of varlist price_per_night distance rating {
    * Print the current name, then summarize that variable.
    display "Summary of `variable'"
    summarize `variable'
}
* The opening brace ends the loop's first line; } goes on its own line.
* A loop repeats commands, not individual rows of the dataset.

* in takes an explicit list. Here each item is a city name.
foreach place in Vienna Budapest Zagreb {
    * Display the current city and count its price quotes.
    display "Price quotes in `place'"
    count if city == "`place'"
}
* Double quotes are needed around the expanded city name because it is text.

* 5. FORVALUES REPEATS COMMANDS OVER A NUMERICAL SEQUENCE
* 2017/2018 means 2017, then 2018, in steps of one.
forvalues search_year = 2017/2018 {
    * The loop local is a year; no string quotes are needed in the comparison.
    display "Price quotes from `search_year'"
    count if year == `search_year'
}

* 6. WHILE REPEATS UNTIL A CONDITION BECOMES FALSE
* Brief demonstration only: foreach and forvalues are our main working tools.
* Start the counter at one.
local counter = 1
* Check the condition before every repetition.
while `counter' <= 3 {
    * Print the current number, then increase it by one.
    display `counter'
    local counter = `counter' + 1
}
* Without the increase, the condition would stay true and the loop would not end.
* For a known sequence like 1 to 3, forvalues would be the simpler choice.

* A SHORT CONNECTION TO LECTURE 4
* Store the outcome and predictor names; expand them into a familiar regression.
local outcome "ln_price"
local predictors "distance rating stars"
* Missing model variables are excluded by regress; quotes repeat within hotels.
regress `outcome' `predictors', vce(cluster hotel_id)
* Longer regression-cutoff loops remain in optional-regression-automation.do.

* 7. HISTOGRAM: WHAT DOES THE PRICE DISTRIBUTION LOOK LIKE?
* Begin with a plain histogram for Vienna quotes of at most EUR 500.
histogram price_per_night if city == "Vienna" & price_per_night <= 500
* Now refine it. /// continues a command onto the next line.
* width(20) sets EUR 20 bins; start(0) fixes the first bin's lower boundary.
* percent uses percentages of the included quotes rather than density.
* title names the subject; xtitle and ytitle give the axes and units.
* note records the sample restriction and reminds us what a row represents.
histogram price_per_night if city == "Vienna" & price_per_night <= 500, ///
    width(20) start(0) percent ///
    title("Hotel prices in Vienna") ///
    xtitle("Price per night (EUR)") ytitle("Percent of price quotes") ///
    note("Hotel quotes with 0 < nightly price <= EUR 500; hotels can repeat.")
* Export the current graph as a PNG, replacing only this output on a rerun.
graph export "output/figures/session05_price_histogram.png", replace width(1600)
* Discuss: changing the bin width changes the picture, not the underlying rows.
* Changing the price limit changes both the rows and the percentage denominator.

* 8. BOX PLOT: HOW DO PRICE DISTRIBUTIONS DIFFER ACROSS CITIES?
* over(city) draws one box for each city, using the same price limit.
* The line inside the box is the median; the box runs from p25 to p75.
* Whiskers reach the most extreme observations within 1.5 box lengths of the
* box edges. Points beyond them are shown separately; they are not necessarily errors.
graph box price_per_night if price_per_night <= 500, over(city) ///
    title("Hotel price distributions by city") ///
    ytitle("Price per night (EUR)") ///
    note("Hotel quotes with 0 < nightly price <= EUR 500; hotels can repeat.")
* Save this graph separately from the histogram.
graph export "output/figures/session05_price_box.png", replace width(1600)
* Compare medians and spread. A mean bar chart alone would hide this variation.

* 9. SCATTERPLOT: HOW ARE PRICE AND DISTANCE ASSOCIATED?
* Stata puts the first variable on the vertical axis and the second horizontally.
scatter price_per_night distance if city == "Vienna" & price_per_night <= 500
* twoway combines layers: scatter draws points; lfit adds a fitted straight line.
* The if condition applies to both layers. Both omit missing prices or distances.
* msize(vsmall) reduces overlap. The legend labels quotes, not distinct hotels.
twoway (scatter price_per_night distance, msize(vsmall)) ///
    (lfit price_per_night distance) ///
    if city == "Vienna" & price_per_night <= 500, ///
    title("Hotel price and distance in Vienna") ///
    xtitle("Distance to city center (miles)") ytitle("Price per night (EUR)") ///
    legend(order(1 "Price quotes" 2 "Linear fit")) ///
    note("Hotel quotes with 0 < nightly price <= EUR 500; hotels can repeat.")
* Export the layered graph. The line describes association, not a causal effect.
graph export "output/figures/session05_price_distance.png", replace width(1600)

* 10. USE A LOOP TO MAKE AND EXPORT A GRAPH FOR EACH CITY
* Store the city list in a local. Run this definition with the entire loop.
local cities "Vienna Budapest Zagreb"
* of local reads items from that named macro; do not put quotes around cities here.
foreach place of local cities {
    * Change the sample and title to the current city. Keep bin boundaries fixed.
    * xlabel fixes the labelled x-axis range, making these charts easier to compare.
    histogram price_per_night if city == "`place'" & price_per_night <= 500, ///
        width(20) start(0) percent xlabel(0(100)500) ///
        title("Hotel prices in `place'") ///
        xtitle("Price per night (EUR)") ytitle("Percent of price quotes") ///
        note("Hotel quotes with 0 < nightly price <= EUR 500; hotels can repeat.")
    * Each city gets its own filename, so later iterations do not overwrite it.
    graph export "output/figures/session05_price_`place'.png", replace width(1600)
}
* Compare one loop graph with the manual Vienna histogram: same sample and bins.
* The y-axis may scale differently by city; read its values when comparing heights.

* Finish recording the lecture. Next, allow 25 minutes for checkpoint 4.
log close session05
