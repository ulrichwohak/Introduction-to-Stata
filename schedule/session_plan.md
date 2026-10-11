# Session plan

Meeting pattern: Mondays, 08:50–10:30<br>
Course dates: 14 September–19 October 2026

## Lecture sequence

Lectures 1 and 2 and their exercises remain unchanged. The revised sequence is:

1. Lecture 3: combining data, with reshaping optional.
2. Lecture 4: running and interpreting regressions, without macros or loops.
3. Lecture 5: programming foundations, then basic graphics and a city export loop.

Lecture numbers identify separate sets of materials, not separate remaining dates.
Lecture 4 uses `session-04-regressions`; the other folder paths are unchanged.

## Remaining meetings

| Date | Material | Assessment |
| --- | --- | --- |
| 5 October | Lecture 3 (`session-03-combining-reshaping`), then Lecture 4 (`session-04-regressions`) | Checkpoint 2 on combining; checkpoint 3 on regression |
| 12 October | Lecture 5 (`session-05-descriptives-graphics`) | Checkpoint 4 on programming and graphics |
| 19 October, 08:50–10:30 | Final in-class exam | 60% of the course grade |

The original exam date and scheduled meeting slot are unchanged.

### 5 October agenda

| Minutes | Activity |
| --- | --- |
| 0–10 | Identify keys and the observation unit; append the annual price files. |
| 10–25 | Merge attributes, inspect matches, calculate nightly prices, and save. |
| 25–40 | Checkpoint 2: reverse the merge direction using 2018 prices. |
| 40–55 | Lecture 4: simple and multiple regressions; check sample sizes. |
| 55–75 | Categorical controls, log price, coefficient interpretation, and uncertainty. |
| 75–95 | Checkpoint 3: rating-price regressions and interpretation. |
| 95–100 | Recap and preview programming and graphics. |

The two lectures and exercises are separate files. Reshaping is not part of this
core agenda. The regression lecture uses the prepared analysis data, not a
student's completed combining exercise.

### 12 October agenda

Teaching slot: **08:50–10:30**. Use the
[Lecture 5 guide](../lectures/session-05-descriptives-graphics/README.md),
[lecture do-file](../lectures/session-05-descriptives-graphics/lecture.do), and
[checkpoint starter](../lectures/session-05-descriptives-graphics/exercise.do).

| Minutes | Activity |
| --- | --- |
| 0–5 | Repeat familiar summaries and identify the text that changes. |
| 5–20 | Local macros, expansion, expressions, scope, and one global demonstration. |
| 20–35 | Practise foreach; introduce forvalues; briefly demonstrate while and connect macros to a familiar regression. |
| 35–65 | Build a histogram, box plot, and scatterplot; add a fitted line and explain each figure. |
| 65–70 | Use a city loop to label and export comparable histograms. |
| 70–95 | Individual programming and graphics checkpoint. |
| 95–100 | Recap, questions, and submissions. |

Students type and run simple commands together. Teach macro definitions and scope
before loops, and build each graph manually before automating it. Keep `while` to
a brief demonstration; custom programs and the extended regression-cutoff example
are optional. Use the prepared `data/derived/hotel_panel.dta`, not an earlier
student exercise output.

## Exercises and assessment

| Material | Assessment |
| --- | --- |
| Workflow exercise (`session-01`) | Ungraded practice |
| Cleaning exercise (`session-02`) | Checkpoint 1, 10% |
| Combining exercise (`session-03`) | Checkpoint 2, 10% |
| Regression exercise (`session-04`) | Checkpoint 3, 10% |
| Programming and graphics exercise (`session-05`) | Checkpoint 4, 10% |
| Final exam, 19 October | 60% |

The four-checkpoint structure and weights are unchanged. Submission details and
any make-up arrangements are announced in class. Previously submitted work is not
invalidated by this revision. The course is Pass/Fail with a total-score pass threshold of 60.

Exercises apply variations of the lecture and require interpretation and validation.
No earlier exercise solution is an input. The revised checkpoints request do-files
and separate logs; checkpoint 4 also requests two city-specific PNGs. Reshaping is not required.

### Checkpoint 4 on programming and graphics

Allow **25 minutes**, worth **10%** of the course score. Students adapt the lecture's
price-histogram loop to guest ratings in **Budapest and Zagreb**. They use locals
and `foreach`, retain Hotel quotes with positive nightly prices up to EUR 500 and
nonmissing ratings, and produce labelled histograms with half-point bins. They
verify the Budapest result manually and write a short interpretation.

Submit the completed do-file, `output/logs/session05_exercise.log`, and the two PNGs
`output/figures/session05_exercise_rating_Budapest.png` and
`output/figures/session05_exercise_rating_Zagreb.png`. Assess a complete, clearly
documented, reproducible attempt; perfect results are not required for full credit.

## Final exam scope

The exam on **19 October, 08:50–10:30**, remains worth **60%**. Basic graphics taught
in Lecture 5 are in scope: histograms, box plots, scatterplots with a fitted line,
labels, sample restrictions, interpretation, and PNG export. Core programming
covers locals, the local/global distinction, `foreach`, and simple `forvalues`
loops. Writing `while` loops is not required. Regression remains core Lecture 4
material, alongside the workflow, cleaning, and combining topics from earlier lectures.

See the [syllabus](../Introduction-to-Stata-Syllabus.md). Detailed exam instructions,
permitted resources, and AI rules are announced separately.

## Optional material

- `session-03-combining-reshaping/optional-reshaping.do`: aggregation and reshaping.
- `session-05-descriptives-graphics/optional-programs.do`: custom programs and city loops.
- `session-05-descriptives-graphics/optional-regression-automation.do`: extended regression-cutoff analysis.
- `session-05-descriptives-graphics/optional-graphics.do` and
  `optional-graphics-exercise.do`: extra tables, a mean bar chart, and ungraded practice.
- `session-06-analysis-simulation/`: adjusted predictions, residuals, and resampling.

These extensions add no exam requirements. Basic graph types taught in Lecture 5
remain required even when an optional file also uses them.
