version 18.0
clear all
set more off
set varabbrev off

* Optional reference: not needed for the core lecture, checkpoint 2, or exam.
* Run lecture.do in this folder first, from the repository root, to save the
* complete merged data. No regression sample restriction is applied here.
capture log close optional_reshaping
log using "output/logs/session03_optional_reshaping.log", ///
    name(optional_reshaping) text replace
use "data/derived/session03_hotel_panel.dta", clear

* A search occasion is identified by the combination of these variables.
* search_id is a compact identifier for that combination.
egen search_id = group(year month weekend holiday nnights), label

* Long: one row per hotel and search. Wide: one row per hotel, with one price
* column per search. The original key tells us what belongs in i() and j().
preserve
    keep if city == "Vienna" & accommodation_type == "Hotel"
    keep hotel_id search_id price_per_night
    isid hotel_id search_id
    reshape wide price_per_night, i(hotel_id) j(search_id)
    describe price_per_night*
    reshape long price_per_night, i(hotel_id) j(search_id)
    * Not every hotel was quoted at every search. Returning to long creates
    * explicit missing-price rows for these combinations, so the row count
    * can increase. No additional prices have been observed.
    count if missing(price_per_night)
    isid hotel_id search_id
restore

* Collapse changes the unit of observation: the result has one row per
* city/year. price_quotes counts observed prices, not distinct hotels.
* preserve/restore lets us inspect and export this table without replacing
* the quote-level data in memory.
preserve
    collapse (count) price_quotes=price_per_night ///
        (mean) mean_price=price_per_night, by(city year)
    isid city year
    list, separator(0)
    export delimited using "output/tables/session03_city_year.csv", replace
restore

log close optional_reshaping
