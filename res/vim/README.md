# background

Suffering from undistinguishable and low-contrast texts, at last I decide to
make my own.

Then I see things in term.

Colors in term may be 8/16/88/256, each is indexed and has its own literal name.
Via palette every index maps to a 24-bit rgb color, without alpha channel. The
default palette varies from term to term, but first 8 indices' names seem
consistent: black, red, green, yellow, blue, magenta, cyan, white. But I cannot
believe they are low-light versions in 8-color terms and high-light version in
all others, as well as I cannot believe there are terms say themselves 8-color
but actually 16-color.

To find ansi colors in a term,
https://github.com/pixelb/scripts/blob/master/scripts/ansi_colours.sh

To find what each of available 256 indices looks like, go to "show-term256.sh"
in this project's hierarchy.

# syntax scheme

It is said grammar has two parts, one is morphology and the other is syntax. So
I say syntax defines how syntax groups are formed, while scheme defines what
color to tint for each group.

Firstly I dig out colors from eclipse thus have eclipse-lite.vim. Surely it is
not good in 8-bit term, so there comes lamp.vim. Both of them are in light
background.

I believe the code is pretty good.

## eclipse-lite

elcipse-lite is a vim scheme appears to eclipse, mainly for java.<br/>
Work on GUI and/or 256-color term. Not work on vim 5.80 or below.

It may look a little different in 256-color term, since all colors are
aligned/degraded to indexed ones.

## lamp

lamp uses very basic/limited colors, so it is (expected) for every term.

# installation

$ mkdir -p $HOME/.vim/colors<br/>
$ cp vim/colors/eclipse-lite.vim $HOME/.vim/colors/
