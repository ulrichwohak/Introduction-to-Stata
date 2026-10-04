version 18.0
clear all
set more off
set varabbrev off

* Run from the repository root after the prepared data have been supplied or
* created. Lecture 3: combine hotel tables and validate the result.
* Reshaping is an optional extension in optional-reshaping.do.
capture log close session03
log using "output/logs/session03.log", name(session03) text replace

* 1. Append: add observations with the same variables.
* Each row is a price quote for a hotel and search occasion, not just a hotel.
* A hotel can therefore appear more than once without being a duplicate.
use "data/derived/hotel_prices_2017.dta", clear
isid hotel_id year month weekend holiday nnights
append using "data/derived/hotel_prices_2018.dta"
isid hotel_id year month weekend holiday nnights
tabulate year

* 2. Merge: add hotel characteristics to each repeated price quote.
* The master data have many rows per hotel; the using file has one row per
* hotel. This direction requires m:1. It is the keys that determine the choice.
merge m:1 hotel_id using "data/derived/hotel_features.dta"
tabulate _merge

* Inspect the match results before deleting anything. In these prepared
* two-year lecture files every record matches. The one-year exercise differs.
assert _merge == 3
drop _merge

* A quote may cover one or four nights. Divide the total by the number of
* nights before comparing prices or interpreting a regression coefficient.
generate double price_per_night = price / nnights
label variable price_per_night "Price per night (EUR)"

* Save the full combined data. No regression is run in this lecture.
* The optional reshaping example also starts from this file.
save "data/derived/session03_hotel_panel.dta", replace

* Regression begins in the separate Lecture 4 do-file.
log close session03
