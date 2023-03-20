#  <img src="https://developer.run/pic/fish_prompt.gif">
#
#  Description
#  -----------
#  Two line prompt with full path and Git integration that scales nicely
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

function fish_prompt
    if set -q SSH_CLIENT || set -q SSH_TTY
        set_color 909d63 --bold;
        set __ssh true
        echo -n "[$USER@"(hostname)"]"
    end

    set_color 777 --bold

    set __git_status (git status 2> /dev/null | head -1)
    
    # Full path + git trimmed to width of terminal
    set prompt_width (math (pwd | string length) + (string length "$__git_status") + 7)
    if test $prompt_width -gt $COLUMNS
      echo -n […(pwd | string sub -s (math $prompt_width - $COLUMNS + 4))"❯ "
    else
      echo -n [(pwd)"❯ "
    end
    
    # Git stuff    
    if [ $__git_status!="" ]
        string match -q "On branch *" "$__git_status"; 
          and string replace "On branch " "⌥" "$__git_status" | read -l __git_status;
          and set_color A6E22E;
          or set_color FD971F;
        
        echo -n $__git_status

        # Need git 2.17.0+
        set_color F92672
        git status -sb --no-column --porcelain | grep -oe "ahead [0-9]*, behind [0-9]*" | string replace "ahead " " ⬆" | string replace ", behind " " ⬇" | xargs echo -n ""; or true
    end

    echo (set_color 777)
    set -q __ssh && echo '🖧 ' || echo '➤ '
end
