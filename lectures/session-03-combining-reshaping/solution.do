version 18.0
clear all
set more off
set varabbrev off

* Run from the repository root after scripts/01_prepare_data.do.
capture log close solution03
log using "output/logs/session03_solution.log", name(solution03) text replace
use "data/derived/hotel_features.dta", clear

* 1. Features have one row per hotel; prices can have several quotes per hotel.
isid hotel_id

* 2. One feature record matches many price records, so this direction is 1:m.
merge 1:m hotel_id using "data/derived/hotel_prices_2018.dta"

* 3. Inspect matches before selecting the observations used for price analysis.
tabulate _merge
count if _merge == 1
* These 105 hotels have features but no quote in the supplied 2018 price file.
* This does not establish that the hotels were closed or unavailable all year.
assert _merge != 2
* No price quote is missing its hotel features.
keep if _merge == 3
drop _merge

* 4. The full search key identifies quotes; hotel_id alone identifies hotels.
isid hotel_id year month weekend holiday nnights
generate double price_per_night = price / nnights
label variable price_per_night "Price per night (EUR)"
count
summarize price_per_night
* There are 4,129 matched quotes, with a mean nightly price of about EUR 146.33.
* A hotel can have several quotes for different dates or lengths of stay.
* We do not save over any input file or the lecture's panel.

* Optional extension only: one row per city/month, then wide and back to long.
* preserve keeps a copy of the quote-level data to restore at the end.
preserve
* Calculate the mean and number of nonmissing prices within each city/month.
collapse (mean) mean_price=price_per_night (count) quotes=price_per_night, by(city month)
isid city month
list, separator(0)
* Wide creates separate columns for each month; long puts months back into rows.
reshape wide mean_price quotes, i(city) j(month)
isid city
reshape long mean_price quotes, i(city) j(month)
isid city month
restore

log close solution03
