version 18.0
* Checkpoint 4: programming and basic graphics. Individual work; 10%; 25 minutes.
* Run from the repository root. Use course materials and Stata help, not AI.

* Prepare memory, output folders, and a separate log.
clear all
set more off
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
capture log close session05_exercise
log using "output/logs/session05_exercise.log", name(session05_exercise) text replace

* 1. MACROS (4 minutes)
* TODO: Define a local called greeting containing some text, then display it.
* Define a global called checkpoint04_message and display it too.
* In a comment, explain which is available in a new selected do-file block.
* Remove only your checkpoint04_message global when you finish this part.

* 2. FOREACH (8 minutes)
* TODO: Put Budapest and Zagreb in a local called cities.
* Use foreach to print "I would like to visit ..." once for each city.
* Add a comment explaining the value of the loop local on each pass.
* Write the first expanded display command once without a macro or loop.
* Check that it prints the same text as the first pass.

* 3. FORVALUES (5 minutes)
* TODO: Use forvalues to go through the numbers 1 to 4 and display each number
* plus 10. Predict the four results in a comment before running the loop.
* Run it and record whether your prediction was correct.

* 4. ONE LINE PLOT (8 minutes)
* The data selection is supplied. No cleaning or regression is required.
use "data/derived/hotel_panel.dta", clear
keep if hotel_id == 21897 & year == 2018
* Check for one quote per month and look at the values.
isid month
list month price_per_night
* TODO: Draw a line plot of price_per_night (y) against month (x), using sort.
* Give it a title and axis labels including the price unit, EUR per night.
* Export output/figures/session05_exercise_line.png.
* In a comment, explain what sort does. Help: help line; help graph export.

* Submit this do-file, output/logs/session05_exercise.log, and the one PNG.
* Full credit is possible for a complete, clearly documented, reproducible
* attempt; perfect results are not required. No analytic comparison is requested.
log close session05_exercise
