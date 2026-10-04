version 18.0
clear all
set more off
set varabbrev off

* Optional, ungraded graphics practice. Not checkpoint 4.
capture mkdir "output"
capture mkdir "output/figures"
capture mkdir "output/tables"
use "data/derived/hotel_panel.dta", clear

* Transfer task: optional-graphics.do compared cities using means and graphed price against
* distance. Investigate Budapest using medians, star categories, and guest ratings.
* Work with price quotes: a hotel can appear more than once. Allow about 20-25 minutes.

* TODO 1: Keep Budapest Hotels with nonmissing price_per_night, stars, and rating,
*         and require 0 < price_per_night <= 1000. Count the retained quotes and
*         validate these rules with assert. Use this same sample for every output.
*         Help: help keep; help f_missing; help assert.
* TODO 2: Export a table with the number of price quotes, median nightly price,
*         and the 25th and 75th price percentiles for each star category. Name it
*         output/tables/session05_exercise_star_summary.csv. Preserve and restore
*         the quote-level data around collapse; do not overwrite the input dataset.
*         Help: help collapse (count, median, p25, p75); help preserve.
* TODO 3: Use graph box to compare the distribution of price_per_night across
*         star categories. Export output/figures/session05_exercise_star_box.png.
*         Look up what the box, central line, whiskers, and outside points mean;
*         whiskers need not reach the minimum and maximum.
*         Help: help graph box (especially over()); help graph export.
* TODO 4: Make a scatter plot of nightly price against guest rating in this same
*         sample. Export output/figures/session05_exercise_rating_scatter.png.
*         Help: help twoway scatter (the order is outcome, then horizontal variable).
* TODO 5: Give both figures informative titles, axes, and units. State Budapest,
*         the price limit, and that observations are repeated price quotes, not
*         distinct hotels. Help: help title_options; help axis_title_options.
* TODO 6: In comments, compare median prices for two star categories using your
*         table, describe their spread using the box plot, and state what the
*         rating scatter adds. Describe associations, not causal effects; explain
*         why the table's count is a count of quotes rather than unique hotels.

display as text "Optional practice: check the do-file, CSV, and two figures."
