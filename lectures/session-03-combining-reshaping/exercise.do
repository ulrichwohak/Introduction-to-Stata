version 18.0
clear all
set more off
set varabbrev off

* Assessment: individual checkpoint 2 of 4; 10% of the overall course grade.
* Lecture 3: combining data only. Reshaping is optional; no regression is required.
* Run from the project root after the prepared data have been supplied or created.
capture mkdir "output"
capture mkdir "output/logs"
capture log close exercise03
log using "output/logs/session03_exercise.log", name(exercise03) text replace
use "data/derived/hotel_features.dta", clear

* Variation: start with one row per hotel and merge in only the 2018 prices,
* instead of appending both years and starting from repeated price quotes.

* TODO 1: Verify that hotel_id uniquely identifies the feature records.
* Explain why hotel_id alone need not be unique in the price file.

* TODO 2: With features still in memory, merge hotel_prices_2018.dta from
* data/derived. Consult help merge to choose the cardinality in this direction.

* TODO 3: Tabulate _merge and count hotels without a 2018 quote. Explain
* what those unmatched records mean. Verify that no price quote lacks features.
* Keep matched observations for the price analysis, then remove _merge.

* TODO 4: Verify the combined key hotel_id year month weekend holiday nnights.
* Generate price_per_night from price and nnights and label it with its unit.
* Count and summarize the matched quotes. Explain why a row counts a quote,
* not a distinct hotel. Do not overwrite any input or the lecture's saved panel.

* Optional: use preserve/restore to collapse to city/month mean nightly prices
* and nonmissing quote counts. Verify the new key and reshape wide and back.
* See optional-reshaping.do and help collapse / help reshape.
* This extension is not required for checkpoint 2 or the exam.

display as text "Submit your completed do-file and session03_exercise.log."
log close exercise03
