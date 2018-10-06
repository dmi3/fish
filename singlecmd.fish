#!/usr/bin/fish

#  Decription
#  -----------
#  * Prompts for single Fish command in left bottom corner of given application window
#  * To make benefit of Fish shell autocompletion and history
#  * Closes after one command is executed
#  * If command fails, leaves window to inspect error message
#  
#  <img src="https://developer.run/pic/singlecmd.fish.gif"/>
#  
#  For example you want execute `git clone git@github.com:dmi3/bin.git` in current directory from Double Commander:
#  
#  * Press `Shift+F2` and terminal window appears in left bottom corner of Double Commander window
#  * First you want `git` and `clone` to be autocompleted using Fish
#  * During clone process you want to see `git` command output to monitor progeress
#  * If everything is ok, promt will close
#  * In case of error you will have chance to read error message
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

#  Requirements
#  ------------
#  * `sudo apt-get install fish wmctrl xterm`

#  Usage
#  -----
#  * Use [Fish config](https://github.com/dmi3/fish) that supports `ONE_COMMAND`
#  * Argument is window title of any app:
#    * `singlecmd.fish "Sublime Text"`
#    * `singlecmd.fish "IntelliJ IDEA"`
#    * ...

#  * OR open Double Commander
#  * `Toolbar` → `Insert new button`:
#    * Command: `/path/to/singlecmd.fish`
#    * Parameters: `"Double Commander"`
#    * Hot Key: `Shift+F2`

set -l X (wmctrl -lG | grep -m 1 "$argv" | awk '{print $3}')
set -l Y (wmctrl -lG | grep -m 1 "$argv" | awk '{print $4}')
set -l H (wmctrl -lG | grep -m 1 "$argv" | awk '{print $6}')
set -l YP (math "$H + $Y - 250")

env SINGLE_COMMAND="true" uxterm -bg "#3E3E3E" -fa "DejaVu Sans Mono" -fs 12 -geometry "57x10+$X+$YP" /usr/bin/fish