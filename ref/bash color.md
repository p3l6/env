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
