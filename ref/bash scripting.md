### Variables
Var | Refers to
---|---
$#  |  number of command-line arguments given.
$?  |  exit value of the last command that was executed.
$0  |  the command run by the user ( zeroth argument ).
$x  |  x'th argument of the command, eg $1, $2.
$*  |  all the arguments ($1 $2 ...). when quoted, single string.
$@  |  all the arguments, when quoted, individual strings ("$1" "$2" ...).
$$  |  process number for shell or script executing.
$!  |  process number of the last background command.

### Colors

to get any color:
`\[\e[0;32m\]  <this is in color 0;32>  \[\e[m\]`

a simpler method with fewer options. works in most terminals.

`$(tput setaf x)<this is in color x>$(tput sgr0)`

Color | x
--- | ---
red | 1
green | 2
yellow | 3
blue|4
purple | 5
light-blue | 6
white | 7

### If conditions
```
if CONDITIONS; then DO STUFF; fi

    Conditions of form: [ -a FILE ]
resolves to true if ...
 -a, -e  FILE exists

resolves to true if FILE exists and it is ...
 -r  readable, -w writable, -x executable,
 -O  owned by the effective user ID, -G owned by the effective group ID,
 -d  a directory,
 -f  a regular file,
 -h, -L  a symbolic link,
 -S  a socket
 -b  a block-special, -c a character-special, -p a named pipe,
 -N  modified since read

resolves to true if FILE exists and it has ...
 -g  its SGID bit set,-k sticky bit is set,
 -s  a size greater than zero,
 -u  its SUID bit set,

resolves to true if file descriptor is open and ...
 -t  refers to a terminal

    Other Conditions
[ FILE1 -nt FILE2 ] FILE1 is changed more recently than FILE2
[ FILE1 -ot FILE2 ] FILE1 is older than FILE2
[ FILE1 -et FILE2 ] Both FILEs refer to the same inode

[ -z STRING ] length of string is zero
[ -n STRING ] or [ STRING ] length of string is non-zero
[ STRING1 == STRING2 ] true if strings are equal
[ STRING1 != STRING2 ] false if strings are equal
[ STRING1 < STRING2 ] true if STRING1 sorts before STRING2

[ A -eq B ] integer comparison, also: -ne, -lt, -le, -gt, -ge

    Combinations ( in precedence order )
[ !EXPR ] not
[ (EXPR) ] order of operations
[ EX -a EXP ] and
[ EX -o EXP ] or

    Also
[ things ] && (do some; stuff)
[ things ] || (do some; stuff)
test things && (do some; stuff)
```