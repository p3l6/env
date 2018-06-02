
## RUNNING / SOURCES
```
$ gdb <program> [core dump]             start gdb, optional core dump
$ gdb --args program <args..>           start gdb and pass arguments
$ gdb --pid <pid>                       start gdb attached to process
set args <args..>                       set the arguments to be passed on run
run                                     run the program
kill                                    kill the running program
thread <thread #>                       choose thread to operate on
directory                               add directory to list searched for sources
```

## BREAKPOINTS / WATCHPOINTS
```
break <where> [if <condition> ]         set a new breakpoint
watch <where> [if <condition> ]         set a new breakpoint
delete <breakpoint|watchpoint #>        remove a breakpoint or watchpoint
clear                                   remove all breakpoints
enable <breakpoint|watchpoint #>
disable <breakpoint|watchpoint #>
```

## < WHERE > / < CONDITION >
```
function_name                           the named function
line_number                             the line number in current source file
file:line_number                        the line number in named source
<condition>                             almost any c expression evaluating to true/false
condition <breakpoint #> <condition>    set or change condition for breakpoint
```

## STEPPING / STACK / MANIPULATION
```
step (stepi)                            go to next instruction/line, into functions
next (nexti)                            go to next instruction/line, skip over functions
finish                                  continue until current function returns
continue                                continue normal execution
backtrace, where                        show call stack
backtrace full, where full              show call stack with all local variables in each
thread apply all where                  show call stack for every thread
frame <frame #>                         select the frame to operate on
set var <variable_name>=<value>         change content of a variable to value
return <expression>                     force function to return now, passing value
handle <signal> <options>               how to handle signals: [no]print, [no]stop, [no]pass ( pass to program )
```

## VARIABLES
```
print[/format] <what>                   print variable or memory location or register
display[/format] <what>                 like print, but print after each step
undisplay <display #>
enable|disable display <display #>
x[/NumFormatUnit]                       print memory, num, format, unit(b byte, h halfword, w word, g giant word)
```

## < FORMAT > / < WHAT >
```
a, d, o, u, x, t                        pointer, int, float, oct, unsigned int, hex, binary
c, s                                    character, c string
expression                              any c, including functions(must cast return type)
file_name:variable_name                 content of a static variable in named file
function::variable_name                 content of variable in function on stack
{type}address                           content at address, interpreted as type
$register                               content of a named register( $esp $ebp $eip .. )
```

##INFORMATION
```
disassemble [<where>]                   show disassembly current function or where
info args                               args of current stack frame
info breakpoints                        info about break and watchpoints
info display                            info about displays
info locals                             info about local vars
info signals                            info about how signals are handled
info threads                            list all threads
show directories                        list places gdb looks for sources
whatis <variable_name>                  print type of variable
list									print out source lines
```
