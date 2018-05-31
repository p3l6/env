

^       = match the start of a line.
$       = match the end of a line.
\       = escape the next character.
[ ]     = match any one of the enclosed characters, as in [aeiou] or [0-9a-c].
[^ ]    = match any one character except those enclosed in [ ].
.       = match a single character of any value, except end of line.
*       = match zero or more of the preceding character or expression.
\( \)   = match subexpression contained in parentheses.
\{x,y\} = match x to y occurrences of the preceding.
\{x\}   = match exactly x occurrences of the preceding.
\{x,\}  = match x or more occurrences of the preceding.
\1      = references group #1.

with egrep ( extended grep )
?       = match preceding element zero or one time.
+       = match preceding element one or more times.
|       = match either expression before or after. abc|def matches abc or def.

grep -i : ignore case
*? +? ?? {x}? = lazy instead of greedy operators.
