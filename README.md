# termcolor-d

![colors](https://i.imgur.com/kF3nEc9.png)

Hackish library use colors with `writeln(...);` on POSIX.

## Examples

```d
// all below retun ANSI color codes, which most terminals will interpret correctly

C.red.fg;       // Color → Red → Foreground
C.blueDark.bg;  // Color → Blue (Dark) → Background
C.reset.fg;     // Color → Default Color → Foreground
C.reset.bg;     // Color → Default Color → Background
resetColor;     // Reset foreground and background colors to default
```

```d
import std.stdio : writeln;

writeln(C.green.fg, "Green text", resetColor);
writeln(C.blue.bg, "Blue", C.blueDark.bg, "Dark", resetColor);
writeln("Written in ", C.yellow.fg, "yellow color and ", C.blackDark.bg, "dark background", resetColor, "!");
```

## [dub](https://code.dlang.org/download)

```js
/// dub.json
"dependencies": {
    "termcolor-d": "~>0.0.1",
    ...
}
```

```js
/// dub.sdl
dependency "termcolor-d" version="~>0.0.1"
```

# Shameless plugs

[`scone 🍞`](https://github.com/vladdeSV/scone) - If you need a more fleshed out library to handle **text**, **colors**, and **keyboard input**.
