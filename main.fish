#  Better integration of [Fish Shell](https://fishshell.com/) and [fzf](https://github.com/junegunn/fzf)
#
#  * See [Official Fish documentation](https://fishshell.com/docs/current/)
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

function fish_user_key_bindings --description "Key bindings. Go to functions definition for description. Use `fish_key_reader`. [Docs](https://github.com/fish-shell/fish-shell/blob/master/share/functions/fish_default_key_bindings.fish)"
#  * Clear input on `Ctrl`+`U`
    bind \cu 'commandline "";'
    
    if type -q fzf # Use fzf if installed
      bind \cr fzf-history-widget
      bind \cf search
      bind \ce scd
      bind \e\cf search-contents
    else # Use poor man completion (as up arrow, without search-as-you-type)
      echo "⚠ fzf is not installed. To greatly improve Ctrl+R, Ctrl+E, Ctrl+Alt+F and Ctrl+F type `update-fzf`"
      bind \cr history-search-backward
    end

#  * Exit on `Esc` if single command mode enabled
#    - See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
    if [ "$SINGLE_COMMAND" = "true" ]
      bind \e 'exit 0'
    end

#  * Convinient directory navigation using `Alt+Ctrl` + `→` `←` `↑`
#    - History back/forward/go to parent dir
#    - You can use Fish as file manager!
#    - Comes handy when you start typing command, then realize wrong dir
    bind \e\[1\;7D "prevd; echo; commandline -f repaint;"
    bind \e\[1\;7C "nextd; echo; commandline -f repaint;"
    bind \e\[1\;7A "cd ..; echo; commandline -f repaint;"
    bind \e\[1\;7B "prevd; echo; commandline -f repaint;"

    math (echo $version | tr -d .)"<231" > /dev/null; and echo "⚠ Please upgrade Fish shell to at least 2.3.0 https://fishshell.com/#platform_tabs"

    bind ! bind_bang
    bind '$' bind_dollar

#  * Send terminate on `Ctrl`+`Shift`+`C` to free `Ctrl`+`C` for copy (in terminal settings). See <https://developer.run/36>
    stty intr \^C
end

#  * Prints directory and currently running command in tab title ↓
#    - <img src="https://developer.run/pic/fish_title.png"/>
function fish_title --description "Prints directory and currently running command in tab title. `user@host` in prompt when connected via ssh."
  set -q SSH_CLIENT || set -q SSH_TTY && echo -n "🖧$USER@"(hostname)" "
  if [ "$_" != "fish" ]; echo "➤ $_ "; end
  echo 🖿 (basename (pwd))
end

function fish_greeting --description "Prints `/var/run/motd.dynamic` as greeting. Use in combination with [headlines.sh](https://github.com/dmi3/bin/blob/master/headlines.sh) to see top news"
  if test -e /var/run/motd.dynamic -a "$SINGLE_COMMAND" != "true"
    set_color 4E9A06
    cat /var/run/motd.dynamic
  end
end

function show_exit_code --description "Show exit code on command failure" --on-event fish_postexec
    set -l last_status $status
    set -g CMD_START_TIME (date)
    if [ $last_status -ne 0 -a $argv != "" ]
      echo (set_color F92672)"✖ $last_status"
    end

    # Exit after first command
    # See <https://github.com/dmi3/fish/blob/master/singlecmd.fish>
    if [ "$SINGLE_COMMAND" = "true" ]
      if [ $last_status -ne 0 ]
        read -P "Command failed ↑"
      else 
        sleep 0.3  
      end
      exit 0
    end  
end

function what-did-just-happened --description "Show start time, and duration of last executed command"
  echo "Started: $CMD_START_TIME"
  echo "Duration: $CMD_DURATIONms"
end

function save_dir --description "If command was executed if directory, save dir to Ctrl+E history for quick access." --on-event fish_postexec
    test "$last_pwd"!="$PWD"; 
      and string match -q -r "(^\$|ls|cd|pwd|ll|echo|man)" $argv;
      or echo "$PWD" >> ~/.local/share/fish/fish_dir_history

    set -g last_pwd "$PWD"
end

# Fzf stuff 
# https://github.com/junegunn/fzf
# https://github.com/junegunn/fzf/blob/master/man/man1/fzf.1

set -x FZF_DEFAULT_OPTS --prompt="⌕ "

#  * `Ctrl`+`R` show fzf (fuzzy) history search where you can:
#    - Super advanched analog or `Ctrl`+`R` in Bash
#    - Execute previos command
#    - Edit command before execution
#    - Delete history entry (very useful for no longer actual commands)
#    - <img src="https://developer.run/pic/fish_history.png"/>
function fzf-history-widget --description "Ctrl+R for history"
    history merge; history | fzf -q (commandline) -e +m --tiebreak=index --sort \
      --preview-window 'up:50%:wrap:hidden' \
      --preview 'echo {}' \
      --bind "left:execute(printf ' commandline %q' {})+cancel+cancel" \
      --bind "right:execute(printf ' commandline %q' {})+cancel+cancel" \
      --bind "del:execute(printf ' history delete %q' {})+cancel+cancel" \
      --bind "ctrl-x:execute(printf {} | xclip -sel clip)+cancel+cancel" \
      --bind "ctrl-a:toggle-preview" \
      --bind "ctrl-e:execute(echo ' eval scd')+cancel+cancel" \
      --header "[⏎] run; [←] edit; [del] delete; [ctrl]+[x] copy; [ctrl]+[a] show full;"\
      | read -l -d \0 result # -d is needed to avoid using space (history ignore) as delimeter
    and commandline $result
    and commandline -f repaint
    and commandline -f execute
end

function search --description "`CTRL`+`F` Fuzzy recursive search files by name in current directory & append selection to current command"
  if [ $argv == ""]
    find $PWD 2>/dev/null | fzf -q "'" \
      --bind "ctrl-f:execute(echo -e \" search-contents\n\")+cancel+cancel" | read -l result; and commandline -a $result
  else
    find $PWD -iname $argv 2>/dev/null  | fzf      
  end    
end

function search-contents --description "`ALT`+`CTRL`+`F` search (fuzzy) file by contents"
  if type -q ag
    ag --nobreak --no-numbers --noheading --max-count 100000 . 2>/dev/null \
        | fzf \
          -q "'" \
          --header 'Searching file contents' \
          --preview-window 'up:3:wrap' \
          --preview 'echo {} | cut -d ":" -f2' \
        | string split ':' | head -n 1 | read -l result
    and commandline $result
    and commandline -f repaint
  else
    echo "⚠ to speed up search install ag"
    grep -I -H -n -v --line-buffered --color=never -r -e '^$' . | fzf | string split ":" | head -n 1 | read -l result
    and commandline $result
    and commandline -f repaint
  end
end

function scd --description "`Ctrl`+`E` to access most frequently visited directories."
    cat ~/.local/share/fish/fish_dir_history | freq | fzf \
    -q "'" -e +m \
    --tiebreak=index \
    --bind "ctrl-r:abort" \
    --sort \
       | cut -c9- | read -l result
    and cd $result
    and commandline -f repaint
    and ls
end

function update-fzf --description "Installs or updates fzf"
  set FZF_VERSION (curl -Ls -o /dev/null -w "%{url_effective}" https://github.com/junegunn/fzf-bin/releases/latest | xargs basename)
  curl -L https://github.com/junegunn/fzf-bin/releases/download/$FZF_VERSION/fzf-$FZF_VERSION-linux_amd64.tgz | tar -xz -C /tmp/
  sudo -p "Root password to install fzf: " mv /tmp/fzf /usr/local/bin/fzf
end

function freq --description "Line frequency in piped input. See <https://gist.github.com/rsvp/1859875>"
  cat 1>| sort -f | uniq -c | sort -k 1nr -k 2f
end

#  * Ignore `ls`, `ll`, and `cd` history. `Ctrl+E` is better way to access previosly visited directories
abbr --add ls ' ls'
abbr --add ll ' ll'
abbr --add cd ' cd'

function bind_bang --description "Type `!!` to get last command"
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function bind_dollar --description "Type `!\$` to get last command argument"
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
