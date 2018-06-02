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

### Commands

```
use 'set -e' to stop execution on the first failure in a script
echo -ne "updating $pc%\r" use inside a loop to overwrite itself each time. -n no newline, \r carriage return but no newline
ln -s existing_file new_pointer # existing file path is relative to location of new_pointer, not current working directory.
'tar xvzf <filename>' to untar, z:gzipped, x:extract, v:verbose, f:filename
'last -10' print the last ten logins
'file' 'stat', information about the type of file and full ls info, respectively
use && to chain commands on the command line, second will execute only on success of the first
for i in $(seq 1 7); do; done # simple for loopd

```
