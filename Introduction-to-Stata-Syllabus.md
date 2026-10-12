# Introduction to Stata (ECBS5241)

**Academic year** 2026–2027 · **Term** Fall · **Host unit** Department of Economics<br>
**Course level** 7 · **US credits** 1 · **ECTS credits** 2<br>
**Instructor** Ulrich Wohak, PhD · [wohaku@ceu.edu](mailto:wohaku@ceu.edu)<br>
**Meetings** Mondays, 08:50–10:30 · 14 September–19 October 2026 (5 teaching sessions and a final exam) · Room TBC<br>
**Course repository** [github.com/ulrichwohak/Introduction-to-Stata](https://github.com/ulrichwohak/Introduction-to-Stata)

---

## Background and overall aim

**Content.** This course introduces Stata as a reproducible research environment. Students
learn to organize a project, write and run do-files, import and validate data, clean and
transform variables, combine datasets, run and interpret regressions, use macros and
loops, and create and interpret basic graphics and descriptive output. Reshaping is an optional extension. The five teaching
sessions contribute to one complete workflow that can be rerun from raw data. The sixth
meeting is the final in-class exam.

**Relevance.** Stata is widely used in economics, public policy, and other quantitative social
sciences. Reliable research requires more than knowing individual commands: analysts must
understand the unit of observation, test keys, record cleaning decisions, separate raw inputs
from generated outputs, and produce results that another person can reproduce. The course
emphasizes these habits from the first do-file.

**Scope.** The course is entirely in Stata. Git may be used to distribute updates, but the
command line, Git, Python, and other programming languages are not course topics.

## Course prerequisites and technical requirements

There is no formal programming prerequisite. Students should be comfortable with basic
quantitative concepts such as variables, observations, means, percentages, and simple linear
relationships.

Students must bring a laptop to every session and have:

- Stata 18 or newer, with permission to create and modify local files.
- A local copy of the course repository.
- Internet access for obtaining course updates; the teaching workflow itself works offline.

Before Session 1, students should open Stata, change the working directory to the repository
root, and confirm that Stata can run:

```stata
do "scripts/00_master.do"
```

Students who cannot access the required Stata version should contact the instructor before
the first meeting.

## Waiting list handling

Priority is given to students from the Department of Economics, with special attention to
students in Economics, Data, and Policy programs. Other students are admitted from the
waiting list subject to program priorities and available places.

## Learning outcomes

By the end of the course, students will be able to:

- Organize a reproducible Stata project using relative paths, do-files, logs, and a master
  script.
- Import CSV and Stata data, inspect storage types and values, identify the unit of
  observation, and validate candidate keys.
- Diagnose and correct unit-bearing strings, missing values, duplicate records, and invalid
  values.
- Generate, label, and verify transformed variables using documented assumptions.
- Append and merge data while checking keys, match results, and the resulting unit of
  observation.
- Run simple and multiple regressions, use categorical controls and log outcomes, and
  interpret coefficients and sample sizes as descriptive associations.
- Define and reference local and global macros, explain their scope, and trace and
  adapt short foreach and forvalues loops, checking one pass manually.
- Create basic line plots and scatterplots with a fitted line; use sort for line
  plots, label axes and units, export figures, and explain what is plotted.
- Read unfamiliar Stata output and documentation and explain every submitted command and
  analytic decision.

Basic regression, programming foundations, and basic graphics are part of the core
teaching and exam scope. Histograms, box plots, while loops, nested loops, reshaping,
custom programs, extended regression-cutoff analysis, additional table exports,
adjusted predictions, and resampling are optional and outside the exam scope.

## Learning activities and teaching methods

The course consists of five interactive 100-minute teaching sessions and a final in-class
exam in the sixth scheduled meeting. Teaching time combines concise
explanations, live coding, prediction questions, debugging, and individual practice. Students
type, run, inspect, and revise code throughout the session rather than watching a completed
demonstration.

The teaching sessions have two connected components:

1. Annotated do-files introduce the concepts. Lecture 5 starts with data-free
   programming practice, then opens a separate file for basic plots.
2. An exercise practises the concepts using short programming tasks or real,
   anonymized hotel-price data, with data selection supplied in checkpoint 4.

Session 1's exercise is ungraded practice. Four individual, reproducible exercise attempts
form the graded checkpoints during the teaching meetings. Checkpoint identifiers and
weights are retained. The four checkpoints cover cleaning; combining; regression;
and programming with graphics. Submission details and any make-up arrangements are announced in class.
There is no checkpoint in the exam meeting.

The course uses hotel data prepared for Békés and Kézdi's Data Analysis for Business,
Economics, and Policy. The source anonymized and slightly altered hotel records to protect
confidentiality. Small attributed extracts are committed to the repository, so classroom
work does not require a live data download.

## Assessment

The course is graded **Pass/Fail** on a total score out of 100. A total score of **60 or
higher** is required to pass.

| Component | Weight | Detail |
| --- | ---: | --- |
| In-class checkpoints | 40% | Four short individual do-files during the teaching meetings, each worth 10% of the total course score. Assessed for a reasonable, reproducible attempt. |
| Final in-class exam | 60% | Individual exam in Session 6 on 19 October, 08:50–10:30, covering the material taught in the five teaching meetings. |

Session 1 is ungraded practice. Session 6 has the final exam and no checkpoint. The
four checkpoints and the final exam are the only graded components.

### In-class checkpoints

Checkpoint work is assessed on whether the student:

- Uses the requested Stata concepts for the session.
- Works from the repository root with relative paths.
- Preserves raw inputs and writes generated material to the designated folders.
- Includes useful validation or diagnostic commands.
- Submits an executable do-file with concise comments.

Perfect results are not required for full checkpoint credit; a complete and clearly documented
attempt is. Submission instructions and any make-up procedure are announced in class.

### Final in-class exam

The individual final exam takes place during Session 6 on Monday, 19 October 2026,
08:50–10:30. This is the original scheduled exam slot and is unchanged. It assesses
the Stata concepts and reproducible workflow taught in the five teaching meetings,
including basic graphics: line plots with sort, scatterplots with a fitted line,
titles, axis labels and units, reading the plotted sample, and PNG export. There is no new lecture
or separate checkpoint in this meeting.

The exam format, duration within the scheduled meeting, task-level marking scheme,
dataset, permitted resources, and submission instructions are **TBD** and will be
announced before the exam. Assessment tasks and marking materials are distributed
separately by the instructor, rather than in the public repository.

## AI and assistance policy

In-class checkpoints are completed without generative AI or AI-enabled coding tools unless an
activity explicitly states otherwise. Students may consult Stata's built-in help and the
course materials.

The final exam's permitted-resource and AI rules are **TBD** and will be announced before
the exam. Permission to use help or other resources during practice and checkpoints does
not establish permission to use them in the exam. Students remain responsible for every
submitted line and conclusion.

## Course contents and schedule

Lectures 1 and 2 and their exercises remain unchanged. The revised sequence keeps
three separate lecture modules: **combining data**, **running and interpreting
regressions**, and **programming and graphics**. Lecture-folder numbers identify
material rather than separate remaining dates.

### Workflow and cleaning foundations

- Stata's data, command, results, and do-file workflow; relative paths and logs.
- Importing, inspecting, and saving data; candidate keys and duplicate reports.
- Parsing strings, numeric conversion, missing values, labels, units, and assertions.
- Materials: `session-01-stata-workflow` and `session-02-cleaning-transforming`.
- Workflow exercise: ungraded. Cleaning exercise: checkpoint 1 (10%).

### Lecture 3 Combining data

- Taught on 5 October, before the separate regression lecture.
- Distinguish hotel attributes from repeated price quotes; identify keys.
- Append annual price extracts, merge hotel attributes, and inspect `_merge`.
- Construct nightly price and save the full combined panel.
- Checkpoint 2 (10%): reverse the merge direction using only 2018 prices and validate
  the result. No regression or reshaping is required.
- Materials: `session-03-combining-reshaping`. Reshaping is optional.

### Lecture 4 Running and interpreting regressions

- Taught on 5 October, after Lecture 3.
- Run simple and multiple regressions manually and compare sample sizes.
- Interpret coefficients in their units and distinguish association from causation.
- Add categorical controls and change the outcome to log nightly price.
- Distinguish price quotes from hotels; cluster standard errors by hotel.
- Checkpoint 3 (10%): use rating as the main predictor, compare specifications,
  and interpret results. No macros or loops are required.
- Materials: `session-04-regressions`.

### Lecture 5 Programming basics and reproducible graphics

- Taught on 12 October, the final teaching meeting before the exam.
- Start with `macros-and-loops.do`: data-free examples of locals, globals, substitution,
  quotes, scope, and loop syntax. Spend 40 minutes on programming practice.
- Trace `foreach` and simple `forvalues` loops one pass at a time; predict output,
  change the list or repeated command, and check a pass manually.
- Then use `graphics.do` for 30 minutes: basic line plots, scatterplots, and a
  fitted line. Practise x/y order, sort, titles, axis labels, and PNG export.
- Use short graphics exercises to change titles, axis variables, and plot layers.
- Checkpoint 4 (10%): define macros, explain scope, trace a foreach loop, predict
  a forvalues loop, and make one labelled line plot from supplied hotel data.
  Submit a do-file, log, and one PNG. Allow 25 minutes, then five minutes for recap.
- Materials: `session-05-descriptives-graphics`; the folder name is retained for links.

### Remaining meetings

On **5 October**, Lectures 3 and 4 and their checkpoints share the 100-minute meeting.
On **12 October**, Lecture 5 and its checkpoint use the 100-minute meeting.
The detailed agendas are in `schedule/session_plan.md`.

The exam remains on **Monday, 19 October 2026, 08:50–10:30**, worth 60%.
It covers the core material actually taught in the five teaching meetings, including
regression, local and global macros, scope, foreach and simple forvalues loops,
and basic line plots and scatterplots. There is no new lecture or checkpoint in the
exam meeting. Detailed instructions will be provided separately.

### Optional reference material

Histograms, box plots, while loops, nested loops, reshaping, custom programs,
extended regression-cutoff analysis, additional table exports, adjusted predictions,
residual diagnostics, and resampling remain optional, ungraded reference and add no
exam requirements. The basic line-plot and scatterplot skills in Lecture 5's
graphics.do remain required. Optional files are named in the lecture guides. The
`session-06-analysis-simulation` files are supplementary examples, not the exam paper
or an additional teaching session.

## Course materials and reproducibility

All required classroom files are stored in the course repository. Attributed hotel CSV files
live under `data/raw/`; derived `.dta` files, logs, figures, and tables are regenerated and
are not part of the published source history. The data are covered by source-specific reuse
terms documented in `DATA_LICENSE.md`: hotel files are for educational, non-commercial use.

For instructor verification, the complete repository workflow, including supplementary
analysis examples, is:

```stata
do "scripts/00_master.do"
```

Students should use Stata's `help` command before relying on third-party examples. Relevant
reference material includes Stata's official documentation, Békés and Kézdi's
[Data Analysis for Business, Economics, and Policy](https://gabors-data-analysis.com/), and
the Data Carpentry [Economics with Stata](https://datacarpentry.org/stata-economics/)
lessons. Dataset documentation is available for
[hotels in Vienna](https://gabors-data-analysis.com/datasets/hotels-vienna/),
[hotels in Europe](https://gabors-data-analysis.com/datasets/hotels-europe/). The official CEU
module description is available in the
[Study Guide](https://ceu.studyguide.timeedit.net/modules/ECBS5241?mainTab=module&type=CORE),
and meeting dates are published in the CEU timetable.
