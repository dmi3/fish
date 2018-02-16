#  Two line propmt with full path and Git integration that scales nicely.
#  <img src="https://developer.run/pic/fish_prompt.gif">
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

function fish_prompt
    set_color 777 --bold

    set __git_branch (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
    
    # Full path + git trimmed to width of terminal
    set prompt_width (math (pwd | string length) + (string length "$__git_branch") + 7)
    if test $prompt_width -gt $COLUMNS
      echo -n […(pwd | string sub -s (math $prompt_width - $COLUMNS + 4))"❯ "
    else
      echo -n [(pwd)"❯ "
    end
    
    # Git stuff    
    if [ $__git_branch!="" ]
        set_color A6E22E
        echo -n '⌥'$__git_branch
        set __git_unpushed_commits (git cherry -v | wc -l)
        if [ $__git_unpushed_commits !=  "0" ]
            set_color F92672
            echo -n " ⬆$__git_unpushed_commits "
        end
    end

    echo
    echo (set_color 777)'➤ '
end