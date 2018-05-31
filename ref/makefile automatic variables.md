
targets : prerequisites | order-only prerequisites
    order-only prerequisites do not trigger a build of this rule when changed
    makefiles must use tabs, not spaces
    make runs each line as a subprosses: to cd somewhere; action on sameline
$@ file name of the target.
$% target member name, when target is an archive member. empty otherwise.
$< name of first prerequisite.
$? names of all prerequisites that are newer than target.
$^ names of all prerequisites, no duplicates, no order-only prerequisites.
$+ like '$^' but duplicates can exist.
$| names of all order-only prerequisites.
$* stem of pattern match. should generally avoid except for implicit rules.
