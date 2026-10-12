version 18.0
* Checkpoint 4: programming and basic graphics. Individual work; 10%.
* Run from the repository root. Use course materials and Stata help, not AI.
* Add your code below each TODO. Answer the questions in short comments.
* Use macros-and-loops.do and graphics.do as guides; adapt their examples.

* Prepare memory, output folders, and a separate log.
clear all
set more off
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
capture log close session05_exercise
log using "output/logs/session05_exercise.log", name(session05_exercise) text replace

* 1. LOCALS AND GLOBALS
* TODO: Store Budapest in a local called city. Use it to display "Hello Budapest".
* Store Stata in a global called checkpoint04_course, then display that global.
* Run the definitions and display commands together. Then select and run only
* the two display commands again, without their definitions.
* In a comment: which macro still contains its text, and why?
* Remove only your checkpoint04_course global after this check.
* Hint: use the different macro quotes shown in macros-and-loops.do.

* 2. TWO SMALL LOOPS
* TODO: Store Budapest and Zagreb in a local called cities.
* Use foreach to display "Welcome to ..." once for each city.
* Before running it, predict the number of output lines and the first city.
* Run the local definition and the whole loop together; check your prediction.

* TODO: Use forvalues to go through 1 to 3 and display 10 times each number.
* Write the three expected numbers in a comment, then run and check the loop.

* 3. A LINE PLOT
* The data selection is supplied: one hotel's quotes for January-April 2018.
* This is a shorter period than in graphics.do. No cleaning is needed.
use "data/derived/hotel_panel.dta", clear
keep if hotel_id == 21897 & year == 2018
keep if month <= 4
* Check for one quote per month and look at the values.
isid month
list month price_per_night
* TODO: Draw a line plot of price_per_night (y) against month (x), using sort.
* Add a title and axis labels: Month and Price per night (EUR).
* Export output/figures/session05_exercise_line.png, using replace.
* In a comment: why do we use sort when connecting these observations?

* 4. A SCATTERPLOT
* Reload the data: the previous selection contained only one hotel.
use "data/derived/hotel_panel.dta", clear
* Use Vienna Hotel quotes from January 2018, with a price and rating to plot.
keep if city == "Vienna" & accommodation_type == "Hotel"
keep if year == 2018 & month == 1
keep if price_per_night > 0 & price_per_night <= 500 & !missing(rating)
* TODO: Plot price_per_night (y) against rating (x), rather than distance.
* Add a title and axis labels: Hotel rating and Price per night (EUR).
* Export output/figures/session05_exercise_scatter.png, using replace.
* In a comment: what does one point in this scatterplot represent?
* OPTIONAL, not needed for full credit: add lfit using the same y and x variables.
* Hint: adapt the twoway example at the end of graphics.do.

* Rerun the complete file so that the log records your final work.
* Submit this do-file, output/logs/session05_exercise.log, and both PNGs.
* Full credit is possible for a complete, clearly documented, reproducible
* attempt; perfect results are not required.
log close session05_exercise
