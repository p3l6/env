
## grep
Symbol | Matches
---|---
`^`      | the start of a line
`$`      | the end of a line
`\`       | escape the next character
`[ ]`     | any one of the enclosed characters, as in [aeiou] or [0-9a-c]
`[^ ]`    | any one character except those enclosed in [ ]
`.`       | a single character of any value, except end of line
`*`       | zero or more of the preceding character or expression
`\( \)`   | subexpression contained in parentheses
`\{x,y\}` | x to y occurrences of the preceding
`\{x\}`   | exactly x occurrences of the preceding
`\{x,\}`  | x or more occurrences of the preceding
`\1`      | references group #1

`grep -i` will ignore case

`*? +? ?? {x}?` are the lazy versions of the standard greedy operators

## egrep
This is  extended grep

Symbol | Matches
---|---
`?` |  preceding element zero or one time.
`+` | preceding element one or more times.
`|` | either expression before or after. `abc|def` matches abc or def.

## Character classes

Class | Alt | Matches
---|---|---
[:alnum:]  |    | a-z, A-Z, and 0-9
[:alpha:]  |    | a-z, A-Z
[:blank:]  |    | spaces or tabs
[:cntrl:]  |    | ASCII 0-31
[:digit:]  | \d | 0-9
[:graph:]  |    | alphanumeric or punctuation
[:lower:]  |    | a-z
[:print:]  |    | [^:cntrl:], [[:graph:][:space:]]
[:punct:]  |    | punctuation
[:space:]  | \s | space, tab, newline, carriage return, form feed, and vertical tab
[:upper:]  |    | A-Z
[:word:]   | \w | a-z, A-Z, 0-9, _
[:xdigit:] |    | 0-9, a-f, A-F
           | \t | tab
           | \n | newline
           | \r | carriage return
           | \b | word boundary
           | \B | nonword
           | \x | start of an ASCII hex code, \x20 for example
