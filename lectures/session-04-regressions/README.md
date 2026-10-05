# Lecture 4: Running and interpreting regressions

Teaching date: 5 October 2026, after Lecture 3 on combining data.

Assessment: checkpoint 3 of 4, worth 10% of the overall course grade.

This lecture contains manual
regressions only; local macros and loops are introduced separately in Lecture 5.

## Learning goals

- Run a simple regression and interpret its coefficient in the correct units.
- Add predictors manually and check whether the number of observations changes.
- Use `i.city_id` and `i.weekend` for categories rather than numeric scales.
- Interpret a log-price outcome and distinguish log differences from euro differences.
- Distinguish price quotes from hotels and understand why standard errors are clustered.
- Read `e(N)` and a coefficient from the most recently estimated model.

## Lecture

Run `lecture.do` from the repository root using `data/derived/hotel_panel.dta`,
supplied by the instructor or created by the preparation and analysis scripts.
It does not depend on a completed exercise.

Start with nightly price on distance, then add rating and stars. Add city/weekend
indicators before changing the outcome to log nightly price. Select Hotel quotes
with positive nightly price no higher than EUR 1,000, applying the restrictions
in separate steps. Each regression excludes observations with missing values in
the variables it needs. Check N when adding predictors: coefficient changes can
reflect both added predictors and a changed sample.
The price limit is a teaching sample choice, not a claim that other
prices are invalid. Stars are treated as continuous because half-star values occur.

A coefficient describes an association, not a causal effect. `vce(cluster hotel_id)`
allows disturbances from quotes at the same hotel to be correlated when computing
standard errors; it does not change OLS coefficients or remove confounding.
N counts quotes, and hotels with more quotes have more weight in this analysis.
The log model's exponentiated coefficient describes a percentage difference on
the geometric-mean scale, not an automatic prediction of arithmetic mean price.

## Graded checkpoint 3

The exercise changes the main predictor from distance to guest rating. Students
compare simple and multiple regressions, add categorical controls, and change the
outcome to log price. They interpret the rating coefficient and check sample sizes.
Commands are written explicitly, without macros or loops.

Submit the completed do-file and `output/logs/session04_exercise.log`.
Use `help regress` and `help fvvarlist` to adapt the demonstrated syntax.
The starter contains TODO prompts, not solutions.

See the [session plan](../../schedule/session_plan.md) for the shared 5 October agenda.
