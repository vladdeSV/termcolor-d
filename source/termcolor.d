/**
 * Hackish library to colorize standard output.
 * Example:
 * ---
 * import termcolor;
 * import std.stdio : write, writeln;
 * import std.traits : EnumMembers;
 * writeln("Written in ", C.green.fg, "green color and ", C.blackDark.bg, "dark background", resetColor, "!");
 *
 * // show all color combinations
 * foreach(f; EnumMembers!C) {
 *     foreach(b; EnumMembers!C) {
 *         write(f.fg, b.bg, "foo", resetColor(), " ");
 *     }
 *     writeln();
 * }
 * ---
 */
module termcolor;

version(Posix):

/**
 * All colors
 *
 * Example:
 * --------------------
 * // Available colors:
 * black       // darker grey
 * blackDark   // black
 * blue
 * blueDark
 * cyan
 * cyanDark
 * green
 * greenDark
 * magenta
 * magentaDark
 * red
 * redDark
 * white       // white
 * whiteDark   // lighter grey
 * yellow
 * yellowDark
 * --------------------
 */
enum C
{
    black = 0,
    red = 1,
    green = 2,
    yellow = 3,
    blue = 4,
    magenta = 5,
    cyan = 6,
    white = 7,

    blackDark = 8,
    redDark = 9,
    greenDark = 10,
    yellowDark = 11,
    blueDark = 12,
    magentaDark = 13,
    cyanDark = 14,
    whiteDark = 15,

    reset = 16,
}
unittest
{
    // ensure there are 8 colors from Color.white(Dark) to Color.black(Dark)
    assert(C.white - C.black == 7);
    assert(C.whiteDark - C.blackDark == 7);
}

string fg(C color)
{
    return color.ANSINumber.ANSIString;
}

string bg(C color)
{
    return (color.ANSINumber + 10).ANSIString;
}

string resetColor()
{
    return 0.ANSIString;
}

private
{
    import std.conv : text;

    version (OSX)
    {
        enum LightColorIndexStart = 90;
        enum DarkColorIndexStart = 30;
    }
    else
    {
        enum LightColorIndexStart = 30;
        enum DarkColorIndexStart = 90;
    }

    /// ANSI color code from enum Color
    int ANSINumber(in C color) pure
    {
        if (color == C.reset) {
            return 39;
        }

        return (color < 8 ? LightColorIndexStart : DarkColorIndexStart) + (color % 8);
    }

    string ANSIString(int number)
    {
        return text("\033[", number, "m");
    }
}
