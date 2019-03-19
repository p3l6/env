### History
```
use ctrl-r to reverse search history semi-interactively
history 10:      print 10 histroy items
!<something>:p = print without executing

!!     = last command
!baz   = last command that starts with baz
!?baz  = last command containing baz
!300   = history item 300
!$     = the last argument of the previous command
!^     = first arg of prev command
!:2    = second arg of prev command
!*     = all arguments of the last command
```

### Misc commands

```
use 'set -e' to stop execution on the first failure in a script
echo -ne "updating $pc%\r" use inside a loop to overwrite itself each time. -n no newline, \r carriage return but no newline
ln -s existing_file new_pointer # existing file path is relative to location of new_pointer, not current working directory.
'tar xvzf <filename>' to untar, z:gzipped, x:extract, v:verbose, f:filename
'last -10' print the last ten logins
'file' 'stat', information about the type of file and full ls info, respectively
use && to chain commands on the command line, second will execute only on success of the first
for i in $(seq 1 7); do; done # simple for loop. modern alternate: for i in {1..7};
```

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

### HereDocs HereStrings

Used to include a document in place. Often used for a script's help information.

```bash
cmd <<EOF
some multiline
comments here
EOF

cmd <<<"single line string" # Equivalent to the following line
echo "single line string" | cmd
```

Placing quotes around the starting delimiter will prevent variable substitution in the contents (`<<"EOF"`)

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
