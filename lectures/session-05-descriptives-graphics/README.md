# Lecture 5 Programming basics and reproducible graphics

Teaching date: 12 October 2026. Checkpoint 4 is worth 10% of the course score.

Learn how macros and loops work, then use them to produce clear graphs from the
hotel data. Type and run the examples together. Every command in `lecture.do`
has an explanation; the file is a teaching reference, not a script to race through.

## Learning goals

- Distinguish a dataset variable from a macro, and local scope from global scope.
- Read the command produced by macro substitution; distinguish text from calculation.
- Use `foreach` for lists and `forvalues` for numerical sequences.
- Recognize how a `while` loop stops; this is a brief demonstration, not a core task.
- Create and interpret a histogram, a box plot, and a scatterplot with a fitted line.
- Label axes, units, and samples; export graphs with distinct, reproducible filenames.
- Use a local and a loop to make city-specific figures and verify one manually.

## Plan for the 100 minute meeting

| Minutes | Activity |
| --- | --- |
| 0–5 | Repeat familiar summaries and identify the text that changes. |
| 5–20 | Local macros, expansion, expressions, scope, and one global demonstration. |
| 20–35 | Practise foreach; introduce forvalues; briefly demonstrate while and connect macros to a familiar regression. |
| 35–65 | Build a histogram, box plot, and scatterplot; add a fitted line and explain each figure. |
| 65–70 | Use a city loop to label and export comparable histograms. |
| 70–95 | Individual programming and graphics checkpoint. |
| 95–100 | Recap, questions, and submissions. |

The same agenda appears in the [course session plan](../../schedule/session_plan.md#12-october-agenda),
alongside the checkpoint requirements and exam scope.

Spend most loop practice on `foreach`. Show `in` and `of varlist`, then use
`of local` for the graph loop. Keep `while` to a short counter demonstration.
The full regression-cutoff analysis and custom programs are not part of this agenda.

## Running the lecture

Run `lecture.do` from the repository root with the instructor-supplied
`data/derived/hotel_panel.dta`, or first run `do "scripts/00_master.do"` to create it.
No completed exercise is needed. All data are local and the lesson works offline.

Run local definitions together with the commands using them. Separate selected-block
runs in the Do-file Editor have separate local scopes. Globals are demonstrated and
then removed; use locals for the working examples.

The lesson first keeps Hotel quotes with positive nightly prices up to EUR 1,000.
Graphs restrict this further to EUR 500. These are sample choices, not claims that
more expensive records are errors. Scatterplots also omit missing distances. Rows are
price quotes, not distinct hotels; hotels with more quotes appear more often.

The histogram introduces bin width and percentages. The box plot compares medians and
spread across cities. The scatterplot adds a fitted line to connect graphics with
regression; it does not establish causality. For city histograms, use the same bin
boundaries and x-axis labels, and read the y-axis values because its scale can differ.

The six exported PNGs go to `output/figures/`: `session05_price_histogram.png`,
`session05_price_box.png`, `session05_price_distance.png`, and
`session05_price_Vienna.png`, `session05_price_Budapest.png`,
`session05_price_Zagreb.png`. The lecture log is `output/logs/session05.log`.

## Graded checkpoint 4

Adapt the price-histogram loop to **guest ratings in Budapest and Zagreb**. Keep
Hotel quotes with positive nightly prices up to EUR 500 and nonmissing ratings.
Define locals for the plotted variable and cities. Count each city's sample, make
labelled histograms with half-point bins, and export one PNG per city. Verify
Budapest manually and write a short interpretation. Allow 25 minutes.

Submit the completed `exercise.do`, `output/logs/session05_exercise.log`, and:

- `output/figures/session05_exercise_rating_Budapest.png`
- `output/figures/session05_exercise_rating_Zagreb.png`

The starter contains prompts, not solutions. Students may use Stata help and the
course materials, but not generative AI. Assess a complete, clearly documented,
reproducible attempt; perfect results are not required for full checkpoint credit.
No global, forvalues, while, regression, or custom program is required for this task.

## Exam scope and optional reference

Basic graphics are now part of the final exam scope: histograms, box plots,
scatterplots and a fitted line, labels and units, sample restrictions, interpretation,
and PNG export. Local macros, the local/global distinction, `foreach`, and simple
`forvalues` loops are core programming material. The `while` demonstration is for
recognition only; writing while loops and custom programs is not required in the exam.

- `optional-regression-automation.do`: longer loops over regression price cutoffs.
- `optional-programs.do`: city-specific regressions and a custom r-class program.
- `optional-graphics.do`: extra descriptive tables and a mean bar chart, plus more graph examples.
- `optional-graphics-exercise.do`: ungraded practice with tables and graphics.

The optional files are not additional checkpoints or additional exam requirements.
Their tables and advanced programming remain optional; the basic graph types taught
in `lecture.do` are required even when an optional file also uses them.
