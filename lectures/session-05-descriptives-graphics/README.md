# Lecture 5 Programming first then basic plots

12 October 2026, 08:50–10:30. This is the last teaching meeting; the exam is on
19 October. Checkpoint 4 remains worth 10% and takes 25 minutes.

Start with [macros-and-loops.do](macros-and-loops.do): short text and number examples, with no dataset
or analysis. Students must be able to trace a loop before moving to
[graphics.do](graphics.do). Finish with [exercise.do](exercise.do).

## Plan for the 100 minute meeting

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

The [session plan](../../schedule/session_plan.md#12-october-agenda) uses the same agenda.

## Programming before analysis

Keep the initial macro explanation to about eight minutes: define and read one
local (2 minutes), rerun its display line alone to show scope (2 minutes), compare
a global and remove it (3 minutes), then check the two reference syntaxes (1 minute).
Reuse the same local example; omit the separate text-versus-arithmetic demonstration.
The following 30 minutes of loop practice reinforce substitution and local scope.

Type and run one example at a time. Pause at each TRY prompt: students predict the
output, change a line, and explain what happened. Ask them to identify the list,
the loop local, and the repeated commands, then write out one pass without a loop.
Keep repeating this until the syntax is clear; the examples are not a speed exercise.

Teach `foreach ... in`, then `foreach ... of local`, and simple `forvalues` ranges.
Show why local definitions and their uses must run in the same selected block.
Demonstrate a global across selections, then remove that named global. Explain the
braces, indentation, and different quotes. No regression, nested loop, `while`,
custom program, or data transformation is needed in the opening file.

## Basic plots

Run `graphics.do` from the repository root with `data/derived/hotel_panel.dta`
available. The master workflow creates it; no earlier exercise solution is needed.

First connect six monthly quotes for Vienna hotel 21897 in January–June 2018.
The records are one-night, non-holiday weekend quotes. `line y x, sort` connects
them in month order. They are individual quotes, not a city average or a continuous
price record. Then use Vienna Hotel quotes from January 2018 for a scatterplot of
price against distance, restricted to positive nightly prices up to EUR 500 and
observed distances. Add `lfit` as a familiar regression connection, not a new analysis.

The short practice prompts ask students to change a title, change an axis variable,
and remove or add the fitted-line layer. Distinguish a line connecting observations
from a fitted regression line. Logs and the two lecture PNGs go under `output/`.

## Checkpoint 4

The starter asks students to define and display a local and a global, explain scope,
trace a two-city `foreach`, check one expanded command, and predict a simple
`forvalues` loop's output. They then make one labelled line plot from a supplied
six-row selection. There is no cleaning, city comparison, or regression task.

Submit the completed do-file, `output/logs/session05_exercise.log`, and
`output/figures/session05_exercise_line.png`. Course materials and Stata help are
allowed; generative AI is not. A complete, clearly documented, reproducible attempt
can receive full credit even if the result is not perfect.

## Exam scope and optional material

Programming: local and global definitions and references, scope, macro substitution,
`foreach`, and simple `forvalues`. Be able to trace, adapt, and explain short loops.
Graphics: basic line plots with `sort`, scatterplots with a fitted line, titles,
axis labels and units, reading the plotted sample, and PNG export.

Histograms and box plots are optional and outside the exam scope, as are `while`,
nested loops, custom programs, and extended regression automation. Optional files
remain available for reference, not as extra material to finish before the exam:

- `optional-graphics.do` and `optional-graphics-exercise.do`: extra tables and plots.
- `optional-programs.do`: a while demonstration and advanced programming examples.
- `optional-regression-automation.do`: repeated models at different price cutoffs.
