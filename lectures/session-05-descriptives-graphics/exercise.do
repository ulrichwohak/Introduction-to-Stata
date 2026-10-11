version 18.0
* Use Stata 18's command behaviour.

* Checkpoint 4: programming and graphics. Individual work; 10% of the course score.
* Lecture 5, 12 October 2026. Allow 25 minutes. Work from the repository root.
* Adapt the lecture's price histograms to guest ratings in Budapest and Zagreb.

* Remove the previous data from memory, show all output, and use full names.
clear all
set more off
set varabbrev off
* Create the output folders if needed; existing folders are left in place.
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
* Record commands and results in a separate exercise log.
capture log close session05_exercise
log using "output/logs/session05_exercise.log", name(session05_exercise) text replace
* Use the prepared data, not a completed earlier exercise.
use "data/derived/hotel_panel.dta", clear

* TODO 1 (5 minutes): Keep Hotel quotes with 0 < price_per_night <= 500 and a
* nonmissing rating. Count the remaining rows and check the rating's range with
* summarize. Each row is a quote, so a hotel can appear more than once.
* Help: help keep; help missing; help summarize.

* TODO 2 (12 minutes): Define a local for the plotted variable (rating) and a
* local holding Budapest and Zagreb. Use foreach to do the following for each city:
* - Print the city name and count its retained quotes.
* - Draw a rating histogram in percent, with width(0.5), start(0), and
*   xlabel(0(1)5). These options mean half-point bins and labels from 0 to 5.
* - Use the variable local in the histogram command. Give the graph a city-specific
*   title, labelled axes (guest rating 0-5 and percent of price quotes), and a note
*   stating the Hotel sample, price limit, and that hotels may repeat.
* - Export a separate PNG for each city using the city local in its filename:
*   output/figures/session05_exercise_rating_Budapest.png and
*   output/figures/session05_exercise_rating_Zagreb.png.
* Run local definitions and the loop together. Help: help foreach; help histogram;
* help graph export. No global, forvalues, while, or regression is required here.

* TODO 3 (5 minutes): Write the Budapest count and histogram commands once
* without macros or a loop. Use exactly the same sample and bin settings.
* Compare the quote count and histogram with your loop's Budapest result.
* Record whether they agree in a comment. Do not overwrite the loop's exports.

* TODO 4 (3 minutes): In two or three comment sentences, describe one visible
* difference or similarity between the cities. Explain what a histogram bar's
* percentage refers to, and why the row counts are not counts of distinct hotels.
* Do not describe an association or a city difference as a causal effect.

* Submit this completed do-file, its log, and the two city PNGs.
* Credit is based on a complete, clearly documented, reproducible attempt;
* a reasonable attempt does not have to produce perfect results for full credit.
display "Complete the TODO items; submit your do-file, log, and two city graphs."
* Close the exercise log, keeping lecture and exercise results separate.
log close session05_exercise
