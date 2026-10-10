version 18.0
clear all
set more off
set varabbrev off

* Run from the repository root after Lecture 1 has saved the raw .dta file.
use "data/derived/session01_vienna_raw.dta", clear

* 1. Identify the reference location, distance unit, and missing-rating marker.
tabulate center2label, missing
list center2distance rating2_ta in 1/8
tabulate rating2_ta, missing
* The location is Donauturm, distances are in miles, and "NA" means unavailable.

* 2. Remove the known unit text, keeping center2distance unchanged.
destring center2distance, generate(landmark_distance_miles) ignore(" miles")
label variable landmark_distance_miles "Distance to Donauturm (miles)"

* 3. Multiply by kilometres per mile; double keeps the calculation precise.
generate double landmark_distance_km = landmark_distance_miles * 1.609344
label variable landmark_distance_km "Distance to Donauturm (km)"
list landmark_distance_miles landmark_distance_km in 1/8

* 4. Work on a copy so the original rating text remains available for checking.
generate rating_text = rating2_ta
replace rating_text = "" if rating_text == "NA"
destring rating_text, generate(alternative_rating)
label variable alternative_rating "Alternative guest rating (0-5)"
drop rating_text
* An empty string becomes numeric missing (.), not zero.
list rating2_ta alternative_rating if rating2_ta == "NA"
assert missing(alternative_rating) if rating2_ta == "NA"

* 5. Diagnose before deleting: no missing IDs and two surplus exact copies.
count if missing(hotel_id)
duplicates report
drop if missing(hotel_id)
duplicates drop
* Only identical rows are removed; hotels with missing ratings are retained.

* 6. Check the key, distances, conversion, and rating rules before saving.
isid hotel_id
assert landmark_distance_miles >= 0 if !missing(landmark_distance_miles)
assert abs(landmark_distance_km - landmark_distance_miles * 1.609344) < 0.000001
assert inrange(alternative_rating, 0, 5) if !missing(alternative_rating)
assert missing(alternative_rating) if rating2_ta == "NA"
count
* There are 428 unique hotels. Numeric conversion alone cannot check whether
* units, plausible values, missing-value decisions, or identifiers are correct.
save "data/derived/session02_exercise_landmark.dta", replace
