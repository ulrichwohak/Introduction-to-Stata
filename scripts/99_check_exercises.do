version 18.0
clear all
set more off

local exercises ///
    "lectures/session-01-stata-workflow/exercise.do" ///
    "lectures/session-02-cleaning-transforming/exercise.do" ///
    "lectures/session-03-combining-reshaping/exercise.do" ///
    "lectures/session-04-regressions/exercise.do" ///
    "lectures/session-05-descriptives-graphics/exercise.do" ///
    "lectures/session-06-analysis-simulation/exercise.do"

foreach exercise of local exercises {
    display as result _newline "Checking `exercise'"
    capture noisily do "`exercise'"
    if _rc != 0 {
        local failed_rc = _rc
        display as error "Exercise check failed in `exercise' with return code `failed_rc'."
        exit `failed_rc'
    }
}

display as result _newline "All exercise starter files run without syntax errors."
