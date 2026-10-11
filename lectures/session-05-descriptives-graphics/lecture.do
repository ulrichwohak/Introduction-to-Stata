version 18.0
* Lecture 5, part 1: programming syntax. No dataset is needed.
* Type each short example together. Predict the output before running it.
* Work from the repository root; move to graphics.do after the programming practice.

* Show results without pausing; record this lesson in its own log.
set more off
capture mkdir "output"
capture mkdir "output/logs"
capture log close session05
log using "output/logs/session05.log", name(session05) text replace

* OPENING (TWO MINUTES)
* display prints text in the Results window. Double quotes surround the text.
display "Hello Vienna"

* 1. A LOCAL IS A NAME FOR SOME TEXT
* Run the next two commands TOGETHER as one selection in the Do-file Editor.
* Store Vienna in a local macro called place. A macro is not a data column.
local place "Vienna"
* Use a backtick on the left and an apostrophe on the right to read a local.
display "Hello `place'"
* Stata substitutes Vienna first, so it runs: display "Hello Vienna".
* Now select and run ONLY the display line again: it prints Hello without Vienna.
* Each selected block runs as a separate temporary do-file with its own locals.
* An undefined local expands to empty text. Run definitions with their uses.

* 2. COMPARE WITH A GLOBAL (SECTIONS 1 AND 2 TAKE ABOUT EIGHT MINUTES)
* A global is available in other do-file runs until removed or Stata closes.
* Run these together, then select and rerun just the display line.
global session05_message "Hello from a global"
* A dollar sign reads a global; braces mark where its name ends.
display "${session05_message}"
* The global is still available in the second selection. Remove it when finished.
macro drop session05_message
* Use locals for today's working examples. Globals can affect other do-files.
* QUICK CHECK: How do you read each kind of macro? Which survives a new selection?
* Reinforce locals in the loops below; no separate arithmetic example is needed.

* 3. FOREACH REPEATS COMMANDS FOR EACH ITEM
* First, write the three commands by hand.
display "Hello Vienna"
display "Hello Budapest"
display "Hello Zagreb"
* Now place the changing text in a loop local called place.
foreach place in Vienna Budapest Zagreb {
    display "Hello `place'"
}
* Read the first pass aloud: place is Vienna, so print Hello Vienna.
* The next passes set place to Budapest and then Zagreb. The loop then ends.
* { belongs at the end of the opening line; } belongs on its own line.
* Indent the repeated commands so you can see the body of the loop.
* A loop repeats commands; it does not automatically move through dataset rows.
* TRY: add Prague to the list. Predict how many lines will be printed.
* TRY: add a second display command inside the braces. Predict the output order.

* Store the list in a local when you want to name or reuse it.
local places "Vienna Budapest Zagreb"
* of local reads that named list. places has no macro quotes on this line.
foreach place of local places {
    display "Hello `place'"
}
* Run the list definition and the WHOLE loop together, including both braces.
* TRY: use two places in the list; write out the two expanded display commands.

* 4. FORVALUES REPEATS COMMANDS FOR A NUMBER SEQUENCE
* 1/3 means 1, 2, 3. i is a local that takes those values one at a time.
forvalues i = 1/3 {
    display "Pass `i'"
    display 2 * `i'
}
* Trace each pass: print its label, calculate twice its number, then continue.
* TRY: change the last number to 5. How many commands will run inside the loop?

* A local can hold the last number. Stata expands it before starting the loop.
local last 3
forvalues i = 1/`last' {
    display "Pass `i'"
}
* TRY: change only last to 4. Run the definition and the loop together.

* BEFORE MOVING ON: explain the loop local, its values, and the repeated body.
* Can you write one pass without a loop? Explain local versus global scope.
* Common checks: matching macro quotes, both braces, and the full selection.
* foreach is for listed items; forvalues is for a sequence of numbers.
* No nested loops, while loops, or regression automation are needed today.
log close session05
