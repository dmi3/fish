# Fish Shell Goodies

# [_install.fish](https://github.com/dmi3/fish/blob/master/_install.fish)

Fish config with awesome flexible prompt, unicode symbols, better fzf integration and lot of handy functions.

Instalation
----------
1. `git clone git@github.com:dmi3/fish.git`
2. Install configs:
   - **All**: run `./_install.fish` ⚠ this will remove `~/.config/fish`! Backup before running
   - **Some**: [source](https://github.com/dmi3/bin/blob/master/config.fish) files you are interested in your `~/.config/fish/config.fish`
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
* `ll` "Scroll ll if theres more files that fit on screen"
* `mkcd` "Create and cd to directory"
* `amount` "Mount archive"
* `aumount` "Unmount all mounted archive (and gvfs locations)"
* `copy` "Copy pipe or argument"
* `copypath` "Copy full file path"
* `color` "Print color"
* `reset_windows`  "Reset all windows size and bring it to main monitor. Useful if DE messes up in multiple monitor configuration"
* `nano
* `run` "Make file executable, then run it"
* `launch` "Launch program"
* `open` "Open file in new process"
* `b` "Exec command in bash. Useful when copy-pasting commands with imcompatible syntax to fish "
* `c` "Math using Python"
* `subl` "Starts Sublime Text. Additionally supports piping (i.e. `ls | subl`) and urls (i.e. `subl http://jenkins/logs`)"
* `qr` "Prints QR"
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
* `git-revert-file` "Revert single file in git"
* `git-wat` "Show 5 latest commits"
* `git-pr` "Create PR on Github"
* `gradle` "Use ./gradlew if exists"
* `src` 'Open/edit source of script or function located in $PATH' --wraps which
* `td` "Add to ~/todo.md list"
* `sdkman` "sdkman"
* `sdkman-init` "Inits sdkman"
<hr/>

# [main.fish](https://github.com/dmi3/fish/blob/master/main.fish)

Better integration of [Fish Shell](https://fishshell.com/) and [fzf](https://github.com/junegunn/fzf)

* Ctrl+R show fzf (fuzzy) history search where you can:
  - Execute previos command
  - Edit command before execution
  - Delete history entry (very useful for no longer actual commands)
<img src="https://developer.run/pic/fish_history.png"/>

* Ctrl+E to show recent directories
* Ctrl+F searches by filename
* Alt+Ctrl+F searches by file contents
* Prints error status in case of command failure
* Clear input on Ctrl+U
* Exit on ESC if single command mode enabled
  - See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
* Convinient navigation using `Alt+Ctrl` + `→` `←` `↑`
  - History back/forward/go to parent dir
  - You can use Fish as file manager!
  - Comes handy when you start typing command, then realize wrong dir
* Send terminate on Ctrl+Shift+C to free Ctrl+C for copy (in terminal settings).
* Prints directory and currently running command in tab title ↓
  - <img src="https://developer.run/pic/fish_title.png"/>
* `fish_user_key_bindings
* `fish_title` "Prints directory and currently running command in tab title"
* `fish_greeting` "Prints `/var/run/motd.dynamic` as greeting. Use in combination with [headlines.sh](https://github.com/dmi3/bin/blob/master/headlines.sh) to see top news"
* `show_exit_code` "Show exit code on command failure" --on-event fish_postexec
* `save_dir` "If command was executed if directory, save dir to Ctrl+E history for quick access" --on-event fish_postexec
* `fzf-history-widget
* `search` "Search files by mask, case insensitive, output with full path"
* `search-contents` "Search file contents"
* `scd
* `update-fzf` "Installs or updates fzf"
* `freq` "Line frequency in piped input"
* `bind_bang` "Type `!!` to get last command"
* `bind_dollar` "Type `!\$` to get last command argument"
<hr/>

# [prompt.fish](https://github.com/dmi3/fish/blob/master/prompt.fish)

<img src="https://developer.run/pic/fish_prompt.gif">
* `fish_prompt` "Two line prompt with full path and Git integration that scales nicely"
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

* `random-name
* `random-alias
* `random-email` "Copy random email in one of Mailinator subdomains and provide link to check it"
* `random-password` "Generate random password" --argument-names 'length'
* `weather` "Show weather"
* `xsh` "Prepend this to command to explain its syntax i.e. `xsh iptables -vnL --line-numbers`"
* `transfer` "Upload file to transfer.sh"
* `translate
* `syn` "Synonym"
* `emoji` "Search emoji"
* `waitweb` 'Wait until web resource is available' --argument-names 'url'
<hr/>
