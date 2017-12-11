#!/bin/bash

# disable middle mouse button pasting
# 1. list your current mouse pointer X mappings using xmodmap -pp (look at the 2nd column)
# 2. swap the button 2 with some unused one, typically the highest number
# 3. add a line e.g. "pointer = 1 9 3 4 5 6 7 8 2" (if there are 9 buttons, for example) to ~/.Xmodmap

# http://dev-loki.blogspot.com/2007/12/disable-middle-mouse-pasting-sort-of.html

#xmodmap -pp | perl -ne 'BEGIN{@a=();$h=0} {next unless /^\s*\d+\s+\d+\s*$/; ($v)=/^\s*\d+\s+(\d+)\s*$/; push(@a,$v); if ($v gt $h) {$h=$v}} END{@b=();foreach(@a){ if ($_ eq "2"){push(@b,$h)} elsif($_ eq $h){push(@b,"2")} else{push(@b,$_)} }; print "pointer = ".join(" ",@b)."\n";}' >> ~/.Xmodmap

#xmodmap ~/.Xmodmap
