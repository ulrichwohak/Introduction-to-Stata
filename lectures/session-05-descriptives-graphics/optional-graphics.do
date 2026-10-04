version 18.0
clear all
set more off
set varabbrev off

* Optional reference: not a graded checkpoint or a required lecture.
* Run from the repository root after the analysis data have been prepared.
capture log close optional_graphics
log using "output/logs/session05_optional_graphics.log", name(optional_graphics) text replace

use "data/derived/hotel_panel.dta", clear
keep if accommodation_type == "Hotel" & price_per_night <= 1000

summarize price_per_night distance rating, detail
tabulate city weekend, row
tabstat price_per_night, by(city) statistics(count mean p50 sd)

preserve
    collapse (count) price_quotes=price_per_night ///
        (mean) mean_price=price_per_night mean_distance=distance ///
        mean_rating=rating, by(city)
    export delimited using "output/tables/session05_city_summary.csv", replace
restore

histogram price_per_night if city == "Vienna" & price_per_night <= 500, ///
    width(20) percent ///
    title("Distribution of Vienna hotel prices") ///
    xtitle("Price per night (EUR)") ytitle("Percent")
graph export "output/figures/session05_price_histogram.png", replace width(1600)

graph bar (mean) price_per_night, over(city) ///
    title("Average hotel price by search city") ///
    ytitle("Mean price per night (EUR)")
graph export "output/figures/session05_city_bar.png", replace width(1600)

twoway ///
    (scatter price_per_night distance if city == "Vienna" & ///
        price_per_night <= 500, msize(vsmall)) ///
    (lfit price_per_night distance if city == "Vienna" & ///
        price_per_night <= 500), ///
    title("Hotel price and distance in Vienna") ///
    xtitle("Distance to city center (miles)") ///
    ytitle("Price per night (EUR)") legend(order(1 "Hotels" 2 "Linear fit"))
graph export "output/figures/session05_price_distance.png", replace width(1600)

log close optional_graphics
