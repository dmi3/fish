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

Useful aliases
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

* Ctrl+R show fzf (fuzzy) history search where you can:
  - Execute previos command
  - Edit command before execution
  - Delete history entry (very useful for no longer actual commands)
<img src="https://developer.run/pic/fish_history.png"/>

* Ctrl+E to show recent directories
* Ctrl+F searches by filename
* Alt+Ctrl+F searches by file contents
* Convinient navigation using `Alt+Ctrl` + `→` `←` `↑`
  - History back/forward/go to parent dir
  - You can use Fish as file manager!
  - Comes handy when you start typing command, then realize wrong dir
* Prints error status in case of command failure
* Prints directory and currently running command in tab title ↓

<img src="https://developer.run/pic/fish_title.png"/>
<hr/>

# [prompt.fish](https://github.com/dmi3/fish/blob/master/prompt.fish)

Two line propmt with full path and Git integration that scales nicely.
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
* `sudo apt-get install fish wmcrtl xterm`

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

Calls to various Web services

<hr/>
