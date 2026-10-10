version 18.0
clear all
set more off
set varabbrev off

* Run from the repository root after Lecture 1 has saved the raw .dta file.
capture log close solution01
log using "output/logs/session01_solution.log", name(solution01) text replace

* 1. use opens a Stata dataset; import delimited is for text files such as CSVs.
use "data/derived/session01_vienna_raw.dta", clear

* 2. Inspect the three variables and check the number of observations.
describe center2distance rating2_ta starrating
codebook center2distance rating2_ta starrating
count
* center2distance and rating2_ta are strings; starrating is numeric.
* Saving as .dta preserves these types and values; it does not clean the text.
* All 430 rows are still present.

* 3. Include missing star ratings in the table, then count three-star records.
tabulate starrating, missing
count if starrating == 3
* There are 141 three-star records.

* 4. if limits each summary without removing observations from memory.
summarize price if starrating == 3
summarize price if starrating == 4
* Mean prices are about EUR 106.18 and EUR 128.63, respectively.
* Four-star records have the higher mean in this raw sample.
count
* The full dataset still contains 430 rows.

* 5. Label and save our own copy, without replacing the lecture's input.
label data "Session 1 exercise: raw Vienna hotel offers"
save "data/derived/session01_exercise_vienna.dta", replace

* Remove the data from memory, then check the saved label and row count.
clear
use "data/derived/session01_exercise_vienna.dta", clear
describe
count

log close solution01
