# Fish Shell Goodies

# [_install.fish](https://github.com/dmi3/fish/blob/master/_install.fish)

Fish config with awesome flexible prompt, unicode symbols, better fzf integration and lot of handy functions.
* Lots of functions/ideas are easily portable to Bash/Zsh/your preffered shell
*  - Feel free to explore!
* This readme [automatically generated](https://github.com/dmi3/bin/blob/master/generate-readme.fish) from comments in scripts
   - Please [notify me](https://github.com/dmi3/fish/issues/new/) if you notice any errors
* Works nice with my [Kitty shell config](https://github.com/dmi3/bin/blob/master/config/kitty/kitty.conf) and [useful script collection](https://github.com/dmi3/bin)

Instalation
----------
1. `git clone git@github.com:dmi3/fish.git`
2. Install configs:
   - **All**: run `./_install.fish` ⚠ this will remove `~/.config/fish`! Backup before running
   - **Some**: [source](config.fish) files you are interested in your `~/.config/fish/config.fish`
3. Install [fzf](https://github.com/junegunn/fzf) or run `fish -c update-fzf`
<hr/>

# [aliases.fish](https://github.com/dmi3/fish/blob/master/aliases.fish)

## Useful aliases
* Create missing directories in path when calling `mkdir`
* `path` command to print full file path
* `rmm` command to remove directories, but ask nicely
* `cpp` command to copy directories, but ask nicely
* Command to add current directory to path
* Human readable sizes for `df`, `du`, `free` (i.e. Mb, Gb etc)
* `fs` command to show free space on physical drives
* `disks` command to List disks
* `partitions` command to list partitions
* `sizeof` command to show size of file or directory
* `connect` command Connect to wifi from terminal
* `lockblock` command to prevent screen  locking untill next reboot
* `wget` to save file with provided name
* If Sublime Text installed - use it instead of Gedit
* Show 3 (next and prev) months in cal, start week on monday
  - Use [nicl](https://github.com/dmi3/nicl) in installed
* If [sssh2](https://github.com/dmi3/bin/blob/master/sssh2) installed - use it instead of ssh
* Show images in [kitty](https://sw.kovidgoyal.net/kitty/)
<hr/>

# [colors.fish](https://github.com/dmi3/fish/blob/master/colors.fish)

Dark theme. See screenshots.
<hr/>

# [completions/todo.fish](https://github.com/dmi3/fish/blob/master/completions/todo.fish)


Decription
----------
Auto generate completion for [todo](https://github.com/dmi3/bin/blob/master/todo) script.
Search script for strings starting with `--` and add them
to Fish completion as arguments for `todo` command
<hr/>

# [config.fish](https://github.com/dmi3/fish/blob/master/config.fish)

Entry point that includes all other configs

<hr/>

# [developer.fish](https://github.com/dmi3/fish/blob/master/developer.fish)

Functions useful for developers  
<hr/>

# [main.fish](https://github.com/dmi3/fish/blob/master/main.fish)

Better integration of [Fish Shell](https://fishshell.com/) and [fzf](https://github.com/junegunn/fzf)
* See [Official Fish documentation](https://fishshell.com/docs/current/)
* Clear input on `Ctrl`+`U`
* Exit on `Esc` if single command mode enabled
  - See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
* Convinient directory navigation using `Alt+Ctrl` + `→` `←` `↑`
  - History back/forward/go to parent dir
  - You can use Fish as file manager!
  - Comes handy when you start typing command, then realize wrong dir
* Send terminate on `Ctrl`+`Shift`+`C` to free `Ctrl`+`C` for copy (in terminal settings). See <https://developer.run/36>
* Prints directory and currently running command in tab title ↓
  - <img src="https://developer.run/pic/fish_title.png"/>
* `Ctrl`+`R` show fzf (fuzzy) history search where you can:
  - Super advanched analog or `Ctrl`+`R` in Bash
  - Execute previos command
  - Edit command before execution
  - Delete history entry (very useful for no longer actual commands)
  - <img src="https://developer.run/pic/fish_history.png"/>
* Ignore `ls`, `ll`, and `cd` history. `Ctrl+E` is better way to access previosly visited directories
<hr/>

# [prompt.fish](https://github.com/dmi3/fish/blob/master/prompt.fish)

<img src="https://developer.run/pic/fish_prompt.gif">
<hr/>

# [singlecmd.fish](https://github.com/dmi3/fish/blob/master/singlecmd.fish)


Decription
-----------
* Prompts for single Fish command in left bottom corner of given application window
* To make benefit of Fish shell autocompletion and history
* Closes after one command is executed
* If command fails, leaves window to inspect error message

<img src="https://developer.run/pic/singlecmd.fish.gif"/>

For example you want execute `git clone git@github.com:dmi3/bin.git` in current directory from Double Commander:

* Press `Shift+F2` and terminal window appears in left bottom corner of Double Commander window
* First you want `git` and `clone` to be autocompleted using Fish
* During clone process you want to see `git` command output to monitor progeress
* If everything is ok, promt will close
* In case of error you will have chance to read error message

Requirements
------------
* `sudo apt-get install fish wmctrl xterm`

Usage
-----
* Use [Fish config](https://github.com/dmi3/fish) that supports `ONE_COMMAND`
* Argument is window title of any app:
  * `singlecmd.fish "Sublime Text"`
  * `singlecmd.fish "IntelliJ IDEA"`
  * ...
* OR open Double Commander
* `Toolbar` → `Insert new button`:
  * Command: `/path/to/singlecmd.fish`
  * Parameters: `"Double Commander"`
  * Hot Key: `Shift+F2`
<hr/>

# [web.fish](https://github.com/dmi3/fish/blob/master/web.fish)

Calls to various CLI friendly web services

* `myip` Shows external ip
* `whereami` is like whoami but shows your external ip and geolocation
* Print color-adjusted xkcd in your terminal! See <https://developer.run/40>
* Show hi-res album art of currently playing song in Spotify
  - Requires [sp](https://gist.github.com/wandernauta/6800547)
<hr/>
