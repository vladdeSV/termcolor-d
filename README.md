# termcolor-d

![colors](https://i.imgur.com/kF3nEc9.png)

Hackish library use colors with `writeln(...);` on POSIX.

## Examples

```d
import std.stdio : writeln;

writeln(C.green.fg, "Green text", resetColor);
writeln(C.blue.bg, "Blue", C.blueDark.bg, "Dark", resetColor);
writeln("Written in ", C.yellow.fg, "yellow color and ", C.blackDark.bg, "dark background", resetColor, "!");
```
