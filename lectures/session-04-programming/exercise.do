version 18.0
clear all
set more off
set varabbrev off

* Assessment: individual checkpoint 3 of 4; 10% of the overall course grade.
* Lecture 4: regressions only. No local macros or loops are needed.
capture mkdir "output"
capture mkdir "output/logs"
capture log close exercise04
log using "output/logs/session04_exercise.log", name(exercise04) text replace
use "data/derived/hotel_panel.dta", clear

* Variation: interpret guest rating instead of distance as the main predictor.

* TODO 1: Select Hotel quotes with positive nightly price no higher than EUR 1,000.
* Create regression_sample and apply the price restrictions in separate steps,
* as in the lecture. Use this indicator in every model below. Each regression
* excludes observations with missing values in the variables it needs.

* TODO 2: Regress price_per_night on rating, then add distance and stars.
* Use vce(cluster hotel_id) in both regressions. Record and compare N.
* If N changes, explain why adding predictors can also change the sample.
* Interpret the rating coefficient in EUR per night per one-point rating change
* on the 0-5 scale, before and after holding the other predictors fixed.

* TODO 3: Add city and weekend indicators, then repeat that specification with
* ln_price as the outcome. Keep the eligibility rules and clustered standard errors.
* Check Number of obs for each model.
* Explain how the unit of the rating coefficient changes with the log outcome.
* Consult help regress and help fvvarlist if needed.

* TODO 4: Explain why N counts quotes rather than hotels, why standard errors
* are clustered, and why adding controls does not establish a causal effect.
* Write commands explicitly; regression automation belongs to the next lecture.

display as text "Submit your completed do-file and session04_exercise.log."
log close exercise04
