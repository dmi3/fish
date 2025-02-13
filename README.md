# Fish Shell Goodies

# [_install.fish](https://github.com/dmi3/fish/blob/master/_install.fish)

                     ___
      ___======____=---=)       _____ _     _     
    /T            \_--===)     |   __|_|___| |_    
    [ \ (0)   \~    \_-==)     |   __| |_ -|   |   
     \      / )J~~    \-=)     |__|  |_|___|_|_|   
      \\\\___/  )JJ~~~   \)            
       \_____/JJ~~~~~    \\
       / \  , \J~~~~~     \\
      (-\)\=|\\\\\~~~~       L__
      (\\\\)  (\\\\\)_           \==__
       \V    \\\\\) ===_____   \\\\\\\\\\\\
              \V)     \_) \\\\\\\\JJ\J\)
                          /J\JT\JJJJ)
                          (JJJ| \UUU)
                           (UU)
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
* We also have [Bash version](https://github.com/dmi3/bin/blob/master/aliases.bash), and portable [Over-SSH version](https://github.com/dmi3/bin/blob/master/sssh2#L39-L64)
* Create missing directories in path when calling `mkdir`
* `path` command to print full file path
* `rmm` command to remove directories, but ask nicely
* `cpp` command to copy directories, but ask nicely
* `cp` to ask when overwriting files
* `mv` to ask when overwriting files
* `add-to-path` Command to add current directory to path
* Human readable sizes for `df`, `du`, `free` (i.e. Mb, Gb etc)
* `fs` command to show free space on physical drives
* `disks` command to List disks
  - Clearly shows which disks are mounted temporary
  - I always run this command before `dd` sd-card, to make 100% sure not to override system partition
* `partitions` command to list partitions
* `sizeof` command to show size of file or directory
* `connect` command Connect to wifi from terminal
* `lockblock` command to prevent screen  locking untill next reboot
* `wget` to save file with provided name
* `unset` to unset enviroment variable
* Prepend `sudo` to `nano` command if file is not editable by current user
  - Warn if file does no exist
* If Sublime Text installed - use it instead of Gedit
* Show 3 (next and prev) months in `cal`, start week on monday
  - Use [nicl](https://github.com/dmi3/nicl) in installed
* If [sssh2](https://github.com/dmi3/bin/blob/master/sssh2) installed - use it instead of ssh
* If [plug](https://github.com/dmi3/bin/blob/master/plug) installed - use it for interactive mount/unmount of USB drives 
* `icat` Show images in [kitty](https://sw.kovidgoyal.net/kitty/)
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
* `launch` "Launch GUI program - hide output and don't close when terminal closes"
* `open` "Open file by default application in new process"
* `b` "Exec command in bash. Useful when copy-pasting commands with imcompatible syntax to fish "
* `c` "Math using Python"
* `qr` "Prints QR. E.g. super useful when you need to transfer private key to the phone without intermediaries `cat ~/.ssh/topsecret.pem | qr`"
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
* `ccat` Cat file, but with syntax highlighting
* `git-show-unpushed-commits` Git show unpushed commits
* `server-here` Start serving files in current directory and open browser
* `git-revert-file` "Revert single file in git"
* `git-wat` "Show 5 latest commits"
* `git-recent-branches` "Show recentbranches"
* `git-pr` "Create PR on Github"
* `gradle` "Use ./gradlew if exists"
* `src` 'Open/edit source of script or function located in $PATH' --wraps which
* `td` "Add to ~/todo.md list"
* `sdkman` "Run sdkman"
* `sdkman-init` "Inits sdkman"
* `bak` "Copies (backups) file in same folder with .bak extension"
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
* `fish_user_key_bindings` "Key bindings. Go to functions definition for description. Use `fish_key_reader`. [Docs](https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_key_bindings.fish)"
* `fish_title` "Prints directory and currently running command in tab title. `user@host` in prompt when connected via ssh."
* `fish_greeting` "Prints `/var/run/motd.dynamic` as greeting. Use in combination with [headlines.sh](https://github.com/dmi3/bin/blob/master/headlines.sh) to see top news"
* `show_exit_code` "Show exit code on command failure" --on-event fish_postexec
* `what-did-just-happened` "Show start time, and duration of last executed command"
* `save_dir` "If command was executed if directory, save dir to Ctrl+E history for quick access." --on-event fish_postexec
* `fzf-history-widget` "Ctrl+R for history"
* `search` "`CTRL`+`F` Fuzzy recursive search files by name in current directory & append selection to current command"
* `search-contents` "`ALT`+`CTRL`+`F` search (fuzzy) file by contents"
* `scd` "`Ctrl`+`E` to access most frequently visited directories."
* `update-fzf` "Installs or updates fzf"
* `freq` "Line frequency in piped input. See <https://gist.github.com/rsvp/1859875>"
* `bind_bang` "Type `!!` to get last command"
* `bind_dollar` "Type `!\$` to get last command argument"
<hr/>

# [prompt.fish](https://github.com/dmi3/fish/blob/master/prompt.fish)

<img src="https://developer.run/pic/fish_prompt.gif">

Description
-----------
Two line prompt with full path and Git integration that scales nicely
* `fish_prompt
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
* `localip` Shows (local) internal ip
* `whereami` is like whoami but shows your external ip and geolocation
* `xkcd` Print color-adjusted xkcd in your terminal! See <https://developer.run/40>
* `albumart` Show hi-res album art of currently playing song in Spotify
  - Requires [sp](https://gist.github.com/wandernauta/6800547)
* `random-name` "Random name for registration on random websites. How about Helen Lovick? Roger Rice?"
* `random-alias` "Docker-like alias generator: `thirsty_mahavira`, `boring_heisenberg`. Don't know how to name file/project/branch/file? Use this!"
* `random-email` "Random email for registration on random websites. Generate random email in one of Mailinator subdomains and provide link to check it. Useful when <http://bugmenot.com/> is not available."
* `duckmails` "Duck Mails! Woo-oo! Private Duck Address Generator"
* `random-password` "Generate random password" --argument-names 'length'
* `weather` "Show weather"
* `xsh` "Prepend this to command to explain its syntax i.e. `xsh iptables -vnL --line-numbers`"
* `syn` "Find synonyms for word"
* `waitweb` 'Wait until web resource is available. Useful when you are waiting for internet to get back, or Spring to start' --argument-names 'url'
* `uselessfact` "Print random useless fact. Makes checking if internet is awailable little less boring"
* `virustotal` "Check file hash by virustotal.com"
<hr/>
