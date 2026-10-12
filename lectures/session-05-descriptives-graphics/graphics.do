version 18.0
* Lecture 5, part 2: a line plot, a scatterplot, and a fitted line.
* Run from the repository root after the programming practice in macros-and-loops.do.
* These examples use the existing textbook data; no new data preparation is taught.

* Clear memory and set up separate graphics outputs and a log.
clear all
set more off
set varabbrev off
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
capture log close session05_graphics
log using "output/logs/session05_graphics.log", name(session05_graphics) text replace

* 1. A BASIC LINE PLOT
* Load prepared hotel quotes. Hotel 21897 is one anonymized Vienna hotel.
use "data/derived/hotel_panel.dta", clear
* Its six 2018 records are one-night, non-holiday weekend quotes, January to June.
keep if hotel_id == 21897 & year == 2018
* Check that each month appears only once; inspect the six values being plotted.
isid month
list month price_per_night
* The first variable is y (vertical); the second is x (horizontal).
* sort connects points in month order, regardless of their order in the data.
line price_per_night month, sort
* Add a title and axis labels. Three forward slashes continue a command below.
line price_per_night month, sort ///
    title("One Vienna hotel's quoted prices in 2018") ///
    xtitle("Month (January to June)") ytitle("Price per night (EUR)")
* Save the graph to a PNG; replace lets us rerun this file.
graph export "output/figures/session05_price_line.png", replace
* PRACTISE: change the title and export under a different filename.
* Explain why month belongs on x and why sort matters.
* These are six observed quotes, not a continuous record or a city average.

* 2. A BASIC SCATTERPLOT
* Reload the full data; use Vienna Hotel quotes from January 2018.
use "data/derived/hotel_panel.dta", clear
keep if city == "Vienna" & accommodation_type == "Hotel"
keep if year == 2018 & month == 1
* Keep positive nightly prices up to EUR 500 and observed distances.
keep if price_per_night > 0 & price_per_night <= 500 & !missing(distance)
* Plot price on y and distance on x; each point is a price quote.
scatter price_per_night distance
* PRACTISE: add a title and axis labels as in the line-plot example.
* Then try rating instead of distance on the horizontal axis.

* 3. ADD A FITTED LINE
* twoway layers graphs; lfit draws the straight line from a simple OLS regression.
* Both layers use the same two variables and the same data in memory.
twoway (scatter price_per_night distance) (lfit price_per_night distance), ///
    title("Hotel price and distance in Vienna") ///
    xtitle("Distance to city center (miles)") ytitle("Price per night (EUR)") ///
    legend(order(1 "Price quotes" 2 "Fitted line"))
* Save this graph separately from the time-ordered line plot.
graph export "output/figures/session05_price_fit.png", replace
* PRACTISE: remove the lfit layer, then add it back. What changes?
* A line plot connects observations in x order; lfit estimates a straight line.
* The fitted line describes an association, not a causal effect.
log close session05_graphics
