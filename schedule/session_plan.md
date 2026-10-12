# Session plan

Meeting pattern: Mondays, 08:50–10:30<br>
Course dates: 14 September–19 October 2026

## Lecture sequence

Lectures 1 and 2 and their exercises remain unchanged. The revised sequence is:

1. Lecture 3: combining data, with reshaping optional.
2. Lecture 4: running and interpreting regressions, without macros or loops.
3. Lecture 5: data-free programming practice, then basic line plots and scatterplots.

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
[programming do-file](../lectures/session-05-descriptives-graphics/macros-and-loops.do),
[graphics do-file](../lectures/session-05-descriptives-graphics/graphics.do), and
[checkpoint starter](../lectures/session-05-descriptives-graphics/exercise.do).

| Minutes | Activity |
| --- | --- |
| 0–2 | Print text by hand; identify the part that changes. |
| 2–10 | Define and read locals and globals; demonstrate quotes and selected-block scope. |
| 10–30 | Trace foreach one pass at a time; change the list and loop body. |
| 30–40 | Practise forvalues; predict output and explain each repeated command. |
| 40–55 | Draw, label, and export a basic line plot; practise x/y order and sort. |
| 55–70 | Draw a scatterplot; change an axis variable and add a fitted line. |
| 70–95 | Individual checkpoint on macros, loops, and one line plot. |
| 95–100 | Recap the exam scope, answer questions, and submit. |

This is the last teaching meeting. Spend the first 40 minutes on programming,
using only short text and number examples. Students predict, run, change, and
explain each loop. Teach macro definitions, quotes, braces, and selected-block
scope explicitly. Do not introduce regression automation or new analytic methods.
Only then open the separate graphics do-file, using the prepared hotel data.
The line plot uses six monthly quotes for one hotel; no aggregation is needed.

The eight-minute macro introduction covers definition and substitution (2 minutes),
local scope across selections (2), a global example and cleanup (3), and a quick
syntax check (1). Locals recur throughout the loop practice. The shorter opening
leaves 30 minutes for the existing plots and practice, without adding topics.

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
and separate logs; checkpoint 4 also requests one line-plot PNG. Reshaping is not required.

### Checkpoint 4 on programming and graphics

Allow **25 minutes**, worth **10%** of the course score. Students define and display
a local and a global, explain scope, and remove their named global (4 minutes).
They trace a two-city `foreach` and check one expanded command (8 minutes), then
predict and run a simple `forvalues` loop (5 minutes). Finally, they draw and export
one labelled line plot from a supplied six-row hotel selection and explain `sort`
(8 minutes). No cleaning, city comparison, or regression is required.

Submit the completed do-file, `output/logs/session05_exercise.log`, and
`output/figures/session05_exercise_line.png`. Assess a complete, clearly
documented, reproducible attempt; perfect results are not required for full credit.

## Final exam scope

The exam on **19 October, 08:50–10:30**, remains worth **60%**. Basic graphics taught
in Lecture 5 are in scope: line plots with `sort`, scatterplots with a fitted line,
titles, axis labels and units, reading the plotted sample, and PNG export. Core programming
covers local and global definitions and references, scope, macro substitution,
`foreach`, and simple `forvalues` loops. Trace, adapt, and explain short loops.
Histograms, box plots, `while`, and nested loops are not required. Regression remains core Lecture 4
material, alongside the workflow, cleaning, and combining topics from earlier lectures.

See the [syllabus](../Introduction-to-Stata-Syllabus.md). Detailed exam instructions,
permitted resources, and AI rules are announced separately.

## Optional material

- `session-03-combining-reshaping/optional-reshaping.do`: aggregation and reshaping.
- `session-05-descriptives-graphics/optional-programs.do`: while, custom programs, and city loops.
- `session-05-descriptives-graphics/optional-regression-automation.do`: extended regression-cutoff analysis.
- `session-05-descriptives-graphics/optional-graphics.do` and
  `optional-graphics-exercise.do`: extra tables, histograms, box plots, and ungraded practice.
- `session-06-analysis-simulation/`: adjusted predictions, residuals, and resampling.

These extensions add no exam requirements. Only the basic line-plot and scatterplot
skills in `graphics.do` are required graphics material.
