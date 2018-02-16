# Fish Shell Goodies

# [_install.fish](https://github.com/fish/bin/blob/master/_install.fish)

Fish config with awesome flexible prompt, unicode symbols, better fzf integration and lot of handy functions.

Instalation
----------
1. `git clone git@github.com:dmi3/fish.git`
2. Install configs:
   - *All* run `./_install.fish` ⚠ this will remove `~/.config/fish`! Backup before running
   - *Some* [source](https://github.com/dmi3/bin/blob/master/config.fish) files you are interested in your `~/.config/fish/config.fish`
3. `fish -c update-fzf`
<hr/>

# [aliases.fish](https://github.com/fish/bin/blob/master/aliases.fish)

 aunpack "$argv" --save-outdir=/tmp/___aaaunpack
 cd (cat /tmp/___aaaunpack)
<hr/>

# [colors.fish](https://github.com/fish/bin/blob/master/colors.fish)

<hr/>

# [completions/todo.fish](https://github.com/fish/bin/blob/master/completions/todo.fish)


Decription
----------
Auto generate completion for [todo](https://github.com/dmi3/bin/blob/master/todo) script.
Search script for strings starting with `--` and add them
to Fish completion as arguments for `todo` command
<hr/>

# [config.fish](https://github.com/fish/bin/blob/master/config.fish)

<hr/>

# [developer.fish](https://github.com/fish/bin/blob/master/developer.fish)

<hr/>

# [main.fish](https://github.com/fish/bin/blob/master/main.fish)

----------
Fish config with awesome flexible prompt, unicode symbols, better fzf integration and lot of handy functions.

Instalation
----------
1. [Install fish](http://fishshell.com/#platform_tabs)
2. `curl https://raw.githubusercontent.com/dmi3/bin/master/config/fish/config.fish --create-dirs -o ~/.config/fish/config.fish`
3. `fish -c update-fzf`
Fish config
https://fishshell.com/docs/current/
<hr/>

# [prompt.fish](https://github.com/fish/bin/blob/master/prompt.fish)

<hr/>

# [singlecmd.fish](https://github.com/fish/bin/blob/master/singlecmd.fish)

<img src="https://developer.run/pic/singlecmd.fish.gif"/>

Decription
-----------
* Prompts for single Fish command in left bottom corner of given application window
* To make benefit of Fish shell autocompletion and history
* Closes after first command is executed
* If command fails, leaves window to inspect error message
For example you want execute `git clone git@github.com:dmi3/bin.git` in current directory from Double Commander:
1. Press `Shift+F2` and terminal window appears in left bottom corner of Double Commander window
1. First you want `git` and `clone` to be autocompleted using Fish
1. During clone process you want to see `git` command output to monitor progeress
1. If everything is ok, promt will close
1. In case of error you will have chance to read error message

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

# [web.fish](https://github.com/fish/bin/blob/master/web.fish)

<hr/>
