### Automatic variables
```
targets : prerequisites | order-only prerequisites
    order-only prerequisites do not trigger a build of this rule when changed
    makefiles must use tabs, not spaces
    make runs each line as a subprocess: to cd somewhere, have the action on same line
    @command: using the at sign will suppress the echo of line prior to executing it
```

Variable | References
---|---
$@  |  file name of the target.
$%  |  target member name, when target is an archive member. empty otherwise.
$<  |  name of first prerequisite.
$?  |  names of all prerequisites that are newer than target.
$^  |  names of all prerequisites, no duplicates, no order-only prerequisites.
$+  |  like '$^' but duplicates can exist.
$\|  |  names of all order-only prerequisites.
$*  |  stem of pattern match. should generally avoid except for implicit rules.

Sample makefile
```makefile
# builds all cpp and java files in directory
SRC=$(wildcard *.cpp)
EXEC=$(SRC:.cpp=)

JAVA_SRC=$(wildcard *.java)
JAVA_CLASS=$(JAVA_SRC:.java=.class)

all:cpp java

cpp:$(EXEC)

java:$(JAVA_CLASS)

#default build thingy for cpp
%:%.cpp
	g++ -Wall -o $@ $^

#default build thingy for java
%.class:%.java
	javac $^

clean:
	rm -rf $(EXEC)
	rm -rf $(JAVA_CLASS)
```
