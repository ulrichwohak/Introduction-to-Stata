version 18.0
clear all
set more off

capture mkdir "data/derived"
capture mkdir "output"
capture mkdir "output/logs"
capture mkdir "output/figures"
capture mkdir "output/tables"

capture log close _all
log using "output/logs/00_master.log", name(master) text replace

display as text "ECBS5241 Introduction to Stata"
display as text "Running the complete reproducible course workflow"

* Includes optional examples for verification; this is not the classroom agenda.
local pipeline ///
    "scripts/01_prepare_data.do" ///
    "scripts/02_build_analysis_data.do" ///
    "lectures/session-01-stata-workflow/lecture.do" ///
    "lectures/session-02-cleaning-transforming/lecture.do" ///
    "lectures/session-03-combining-reshaping/lecture.do" ///
    "lectures/session-04-regressions/lecture.do" ///
    "lectures/session-03-combining-reshaping/optional-reshaping.do" ///
    "lectures/session-05-descriptives-graphics/lecture.do" ///
    "lectures/session-05-descriptives-graphics/optional-programs.do" ///
    "lectures/session-05-descriptives-graphics/optional-graphics.do" ///
    "lectures/session-06-analysis-simulation/lecture.do"

foreach script of local pipeline {
    display as result _newline "Running `script'"
    capture noisily do "`script'"
    local script_rc = _rc
    display as text "Return code: `script_rc'"
    if `script_rc' != 0 {
        local failed_rc = `script_rc'
        display as error "Pipeline stopped in `script' with return code `failed_rc'."
        log close master
        exit `failed_rc'
    }
}

display as result _newline "All course do-files completed successfully."
log close master
