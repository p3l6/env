# Placeholders

`%[parameter][flags][width][.precision][length]type`

### [parameter]
`n$` - n is the number of the parameter to use. allows using parameters out of order, or multiple times. one-based. if using, must use for all placeholders in string.

### [flags]
Flag | Effect
---|---
`+`     | always denote the sign of a number.
`space` | prefixes non-negative signed numbers with a space ( where a minus would be ).
`-`     | left-align the output of this placeholder ( default is right ).
`#`     | alternate form. (g,G trailing zeros allowed)(f,F,e,E,g,G always has decimal point)(o,x,X add 0,0x,0X, to beginning).
`0`     | use 0 to pad a field when width is defined.

### [width]
specify minimum number of characters to output.

### [.precision]
specify digits to the right of the decimal or number of string characters.

### [length]
Code | Length
---|---
hh    |  expect an int-sized integer promoted from char.
h     |  expect an int-sized integer promoted from short.
l     |  expect a long-sized integer.
ll    |  expect a long long-sized integer.
L     |  expect a long double.
z     |  expect a size_t-sized integer.
j     |  expect a intmax_t-sized integer.
t     |  expect a ptrdiff_t-sized integer.

### type
Code | Type
---|---
d,i   |  signed decimal number.
u     |  unsigned decimal number.
f,F   |  double normal notation.
e,E   |  double exponent notation.
g,G   |  double in either notation, whichever is more appropriate.
x,X   |  unsigned int in hexidecimal.
o     |  unsigned int in octal.
s     |  null terminated string.
c     |  char.
p     |  void* .
n     |  print nothing, write number of characters written into an integer pointer.
%     |  literal %, no flags accepted.
