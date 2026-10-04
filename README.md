# Introduction to Stata

Course materials for **ECBS5241 Introduction to Stata** at Central European University.
The course meets on Mondays from 08:50 to 10:30, 14 September–19 October 2026.

The repository supports five hands-on teaching sessions and a final in-class exam in the
sixth meeting. Students work with real hotel-price data prepared for *Data Analysis for
Business, Economics, and Policy* while learning to import, clean, combine, and analyze
data reproducibly with do-files. The revised sequence is **combine data →
run regressions manually → automate repeated regressions**. Reshaping is optional.

## Repository structure

- `lectures/`: topic modules with an annotated lecture do-file, a student exercise, and
  a short guide. Existing folder numbers are retained for stable links. On **5 October**,
  use Lecture 3 in `session-03-combining-reshaping` for combining, then the separate
  Lecture 4 in `session-04-programming` for regressions. On **12 October**, use
  Lecture 5 in `session-05-descriptives-graphics` for local macros and loops.
  The former graphics materials remain optional, ungraded reference.
  The Session 6 files extend regression to margins and resampling; those extensions are optional.
- `data/raw/`: attributed hotel CSV files committed for reliable offline teaching.
- `data/derived/`: generated Stata datasets; not committed.
- `scripts/`: the reproducible build pipeline and master do-file.
- `schedule/session_plan.md`: dates, topics, materials, and assessment checkpoints.
- `output/`: generated logs, figures, and tables; not committed.

## Requirements

- Stata 18 or newer. The course files begin with `version 18.0`.
- A laptop with permission to read and write files in the cloned repository.
- Git is useful for obtaining course updates, but Git and the command line are not course
  topics.

## Getting started

1. Clone or download this repository.
2. Open Stata and change the working directory to the repository root—the folder containing
   this README.
3. Run the complete reproducible workflow:

   ```stata
   do "scripts/00_master.do"
   ```

To work on one class, open its `lecture.do` or `exercise.do` file from the corresponding
folder under `lectures/`. The master workflow also verifies optional examples; running
a file as part of that workflow does not make its topics required.

## Reproducibility contract

- Do-files use paths relative to the repository root. They contain no machine-specific
  working directory.
- Files under `data/raw/` are treated as immutable inputs.
- The preparation scripts regenerate the shared hotel-analysis datasets. Lecture 1 also
  saves `session01_vienna_raw.dta`, the starting file for Exercises 1 and 2. The complete
  master workflow recreates all of these inputs.
- Generated files belong under `data/derived/` or `output/` and may be deleted safely.
- Student-facing code uses official Stata commands only; no community package is required.

## Assessment

Exercises practise variations of the lecture: a different file format, variable, sample,
grouping, or statistic. Students adapt the demonstrated ideas, consult Stata's help for the
changed syntax, and explain and validate the result. Repeating the lecture line for line
is not the exercise objective. Each session guide identifies its variation and required
input files. Exercise outputs have their own names and never replace lecture outputs.

The course is Pass/Fail. Session 1 has ungraded practice. Four individual in-class
checkpoints during the teaching meetings each contribute 10% of the course score (40% in
total). Checkpoint 2 covers combining, checkpoint 3 regression, and checkpoint 4
regression automation. Submission details and any make-up arrangements are announced in class. The final in-class exam in Session 6 on 19 October (08:50–10:30) contributes 60% and covers
material taught in the five teaching meetings, including introductory regression and
regression automation. Reshaping, custom programs, the optional graphics extensions, margins, and resampling are optional
and outside the exam scope. A total score of 60 or more is required to pass.

See the syllabus for the assessment outline. Detailed exam instructions will be provided
by the instructor separately.

## Data

Sessions 1–2 use the authors' raw Vienna hotel extract. Sessions 3–5 and the supplementary
regression/resampling materials use an unmodified-row extract for Vienna, Budapest, and
Zagreb from the European hotel file. Hotels are anonymized, and the source was slightly
altered by its authors to protect confidentiality.

See `DATA_LICENSE.md` and `data/README.md` for provenance, checksums, and reuse terms.

## License

Code and original course materials are released under the MIT License. The data files are
excluded from that license and retain the terms documented in `DATA_LICENSE.md`.
