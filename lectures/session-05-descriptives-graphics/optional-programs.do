version 18.0
clear all
set more off
set varabbrev off

* Optional extension, outside the 100-minute core class and checkpoint.
* Locals and foreach are sufficient for the required repeated regressions.
capture mkdir "output"
capture mkdir "output/logs"
capture log close session05_optional
log using "output/logs/session05_optional.log", name(session05_optional) text replace

use "data/derived/hotel_panel.dta", clear
keep if accommodation_type == "Hotel" & price_per_night <= 1000

* An optional city loop. Each city has its own regression sample.
* Within a city, no city indicators are needed.
levelsof city, local(cities)
foreach place of local cities {
    regress ln_price c.distance c.rating c.stars i.weekend ///
        if city == `"`place'"', vce(cluster hotel_id)
}

* A custom program packages commands behind a new command name.
* syntax reads the requested variable and optional sample restrictions.
* marksample combines those restrictions with the nonmissing-variable check.
* rclass makes the program's explicitly returned results available in r().
capture program drop hotel_summary
program define hotel_summary, rclass
    version 18.0
    syntax varname(numeric) [if] [in]
    marksample touse
    quietly summarize `varlist' if `touse', detail
    return scalar N = r(N)
    return scalar mean = r(mean)
    return scalar median = r(p50)
end

hotel_summary price_per_night if city == "Vienna"
return list
assert r(N) > 0

* Check the program against the underlying command on the same sample.
summarize price_per_night if city == "Vienna", detail

log close session05_optional
