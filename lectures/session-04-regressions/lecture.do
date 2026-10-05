version 18.0
clear all
set more off
set varabbrev off

* Lecture 4: running and interpreting regressions, 5 October 2026.
* Macros and loops come in Lecture 5.
* Run from the repository root using the prepared hotel analysis data.
capture mkdir "output"
capture mkdir "output/logs"
capture log close session04
log using "output/logs/session04.log", name(session04) text replace
use "data/derived/hotel_panel.dta", clear

* 1. Understand the data and select the quotes eligible for analysis.
* A row is a price quote, not a distinct hotel. The nightly price and its
* natural logarithm were created in the preparation pipeline.
describe hotel_id price_per_night ln_price distance rating stars city_id weekend
* Select hotels, then apply each price restriction separately.
generate regression_sample = accommodation_type == "Hotel"
replace regression_sample = 0 if price_per_night <= 0
replace regression_sample = 0 if price_per_night > 1000
* Missing numeric values are larger than any number in Stata, so the last
* restriction also excludes missing prices.
count if regression_sample
summarize price_per_night distance rating stars if regression_sample

* The price limit defines our teaching sample; higher prices are not automatically
* errors. Each regression excludes quotes with missing values in the variables
* it needs. Check Number of obs: adding predictors can change the sample.
* count above counts eligible quotes, not necessarily those used by every model.

* 2. Simple regression: the outcome comes first, then the predictor.
* The distance coefficient is the fitted EUR-per-night difference associated
* with one extra mile from the city center. Read its sign, size, and units.
* The intercept is the fitted price at zero distance in this simple model.
* These are associations, not evidence that changing distance causes a price change.
*
* Quotes from one hotel may have correlated disturbances. vce(cluster hotel_id)
* accounts for this when calculating standard errors. It does not change the
* OLS coefficients or remove confounding. N counts quotes; clusters count hotels.
regress price_per_night distance if regression_sample, vce(cluster hotel_id)
display as text "Price quotes used: " e(N)

* 3. Multiple regression: add rating and stars manually.
* Interpret distance holding the other included predictors fixed. Rating is on
* a 0-5 scale. We treat stars as continuous; some observations have half-stars.
regress price_per_night distance rating stars if regression_sample, ///
    vce(cluster hotel_id)
display as text "Price quotes used: " e(N)

* Compare distance coefficients and N. If N changes, the coefficient comparison
* reflects both added predictors and different observations. Adding controls
* does not establish causation. A confidence interval expresses uncertainty
* under the model; a p-value is not the probability that the model is true.

* 4. Categorical controls: i. creates category indicators and omits a reference.
* City codes are labels, not a meaningful numeric scale. c. marks continuous
* predictors explicitly. The weekend indicator compares with the omitted category.
tabulate city_id if regression_sample
tabulate weekend if regression_sample
regress price_per_night c.distance c.rating c.stars i.city_id i.weekend ///
    if regression_sample, vce(cluster hotel_id)

* 5. Change the outcome to log nightly price, keeping the eligibility rules.
* A coefficient is now a log-price difference, not a euro difference. For small
* coefficients, 100*b approximates the percentage difference. The exact expression
* below refers to the model's geometric-mean scale, not arithmetic mean price.
regress ln_price c.distance c.rating c.stars i.city_id i.weekend ///
    if regression_sample, vce(cluster hotel_id)
display as text "Approximate percentage difference per mile: " ///
    as result %9.2f (100 * _b[distance])
display as text "Exact percentage difference on the geometric-mean scale: " ///
    as result %9.2f (100 * (exp(_b[distance]) - 1))

* regress stores results in e(). Inspect them before another model replaces them.
ereturn list
display as text "Price quotes used: " e(N)

* No macros or loops today. Lecture 5 starts by repeating a regression manually
* and then introduces automation to avoid rewriting the same command.
log close session04
