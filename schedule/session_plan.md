# Session plan

Meeting pattern: Mondays, 08:50–10:30<br>
Course dates: 14 September–19 October 2026

## Lecture sequence

Lectures 1 and 2 and their exercises remain unchanged. The revised sequence is:

1. Lecture 3: combining data, with reshaping optional.
2. Lecture 4: running and interpreting regressions, without macros or loops.
3. Lecture 5: local macros and foreach loops to automate regressions.

Lecture numbers identify separate sets of materials, not separate remaining dates.
Existing folder paths are retained so that links continue to work.

## Remaining meetings

| Date | Material | Assessment |
| --- | --- | --- |
| 5 October | Lecture 3 (`session-03-combining-reshaping`), then Lecture 4 (`session-04-programming`) | Checkpoint 2 on combining; checkpoint 3 on regression |
| 12 October | Lecture 5 (`session-05-descriptives-graphics`) | Checkpoint 4 on regression automation |
| 19 October, 08:50–10:30 | Final in-class exam | 60% of the course grade |

The original exam date and scheduled meeting slot are unchanged.

### 5 October agenda

| Minutes | Activity |
| --- | --- |
| 0–10 | Identify keys and the observation unit; append the annual price files. |
| 10–25 | Merge attributes, inspect matches, calculate nightly prices, and save. |
| 25–40 | Checkpoint 2: reverse the merge direction using 2018 prices. |
| 40–55 | Lecture 4: simple and multiple regressions on one common sample. |
| 55–75 | Categorical controls, log price, coefficient interpretation, and uncertainty. |
| 75–95 | Checkpoint 3: rating-price regressions and interpretation. |
| 95–100 | Recap and preview automation. |

The two lectures and exercises are separate files. Reshaping is not part of this
core agenda. The regression lecture uses the prepared analysis data, not a
student's completed combining exercise.

### 12 October agenda

See the detailed 100-minute plan in `lectures/session-05-descriptives-graphics/README.md`.
Begin with manually repeated regressions, then introduce locals and `foreach`.
Allow 25 minutes for the automation checkpoint.

## Exercises and assessment

| Material | Assessment |
| --- | --- |
| Workflow exercise (`session-01`) | Ungraded practice |
| Cleaning exercise (`session-02`) | Checkpoint 1, 10% |
| Combining exercise (`session-03`) | Checkpoint 2, 10% |
| Regression exercise (`session-04`) | Checkpoint 3, 10% |
| Regression automation exercise (`session-05`) | Checkpoint 4, 10% |
| Final exam, 19 October | 60% |

The four-checkpoint structure and weights are unchanged. Submission details and
any make-up arrangements are announced in class. Previously submitted work is not
invalidated by this revision. The course is Pass/Fail with a total-score pass threshold of 60.

Exercises apply variations of the lecture and require interpretation and validation.
No earlier exercise solution is an input. The revised checkpoints request do-files
and separate logs. Reshaping is not required.

## Optional material

- `session-03-combining-reshaping/optional-reshaping.do`: aggregation and reshaping.
- `session-05-descriptives-graphics/optional-programs.do`: custom programs and city loops.
- `session-05-descriptives-graphics/optional-graphics.do` and
  `optional-graphics-exercise.do`: descriptive graphics and ungraded practice.
- `session-06-analysis-simulation/`: adjusted predictions, residuals, and resampling.

These extensions are outside the exam scope. The exam covers the core material
actually taught, including regression and regression automation. Detailed exam
instructions, permitted resources, and AI rules are announced separately.
