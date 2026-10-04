version 18.0
clear all
set more off
set varabbrev off

* Assessment: individual checkpoint 4 of 4; 10% of the overall course grade.
* Lecture 5, 12 October 2026. Allow 25 minutes.
* Run from the project root using the prepared analysis dataset.
capture mkdir "output"
capture mkdir "output/logs"
capture log close session05_exercise
log using "output/logs/session05_exercise.log", name(session05_exercise) text replace

use "data/derived/hotel_panel.dta", clear
keep if accommodation_type == "Hotel"

* Variation: use the central_hotel indicator instead of continuous distance.
* The model relates log nightly price to being within 2 miles of the center,
* controlling for rating, stars, city, and weekend. It describes association.
* Use vce(cluster hotel_id) in every regression: a hotel has repeated quotes.

* TODO 1: Inspect ln_price, central_hotel, rating, stars, city_id, and weekend.
* Consult help regress and help fvvarlist as needed. Define a common-sample
* indicator excluding missing values in these variables and hotel_id.
* Use this same indicator in every model below; add the price cutoff separately.

* TODO 2: Define local macros for the outcome, predictors, and upper price
* cutoffs 100, 200, and 500. Use factor-variable notation for central_hotel,
* city_id, and weekend. Display the outcome and predictors to check the text.

* TODO 3: Write a foreach loop over the cutoffs. Run the regression on the
* common sample with price_per_night at or below the current cutoff.
* Display the cutoff and e(N) immediately after each regression. Also report
* the coefficient comparing central with noncentral hotels; use the coefficient
* name shown in the regression output. Do not permanently filter the dataset.

* TODO 4: Manually write and run the full regression for one cutoff, without
* using macros for the outcome, predictors, or cutoff. Compare its observation
* count and central-hotel coefficient with that loop iteration. Record the
* comparison in a comment. Explain why this check is more useful than merely
* observing that the loop runs without an error.

* TODO 5: In two or three sentences, explain what happens to the sample and
* the estimated central-hotel association as the cutoff changes. N counts
* price quotes, not unique hotels. These are different samples selected on
* price; do not interpret a coefficient change as a causal effect of the cutoff.

* TODO 6: Interpret the central-hotel coefficient from your manually checked
* model in log-price or approximate percentage terms, holding controls fixed.
* Briefly explain why standard errors are clustered by hotel.

display as text "Complete the TODO items and submit your do-file and log."
log close session05_exercise
