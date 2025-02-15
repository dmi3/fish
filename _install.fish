#!/usr/bin/fish

#                       ___
#        ___======____=---=)       _____ _     _     
#      /T            \_--===)     |   __|_|___| |_    
#      [ \ (0)   \~    \_-==)     |   __| |_ -|   |   
#       \      / )J~~    \-=)     |__|  |_|___|_|_|   
#        \\\\___/  )JJ~~~   \)            
#         \_____/JJ~~~~~    \\
#         / \  , \J~~~~~     \\
#        (-\)\=|\\\\\~~~~       L__
#        (\\\\)  (\\\\\)_           \==__
#         \V    \\\\\) ===_____   \\\\\\\\\\\\
#                \V)     \_) \\\\\\\\JJ\J\)
#                            /J\JT\JJJJ)
#                            (JJJ| \UUU)
#                             (UU)
# 
#  Fish config with awesome flexible prompt, unicode symbols, better fzf integration and lot of handy functions.
#  * Lots of functions/ideas are easily portable to Bash/Zsh/your preffered shell
#  *  - Feel free to explore!
#  * This readme [automatically generated](https://github.com/dmi3/bin/blob/master/generate-readme.fish) from comments in scripts
#     - Please [notify me](https://github.com/dmi3/fish/issues/new/) if you notice any errors
#  * Works nice with my [Kitty shell config](https://github.com/dmi3/bin/blob/master/config/kitty/kitty.conf) and [useful script collection](https://github.com/dmi3/bin)

#  Instalation
#  ----------
#  1. `git clone git@github.com:dmi3/fish.git`
#  2. Install configs:
#     - **All**: run `./_install.fish` ⚠ this will remove `~/.config/fish`! Backup before running
#     - **Some**: [source](config.fish) files you are interested in your `~/.config/fish/config.fish`
#  3. Install [fzf](https://github.com/junegunn/fzf) or run `fish -c update-fzf`
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME "$HOME/.config"

read -P "⚠ Warning this will remove $XDG_CONFIG_HOME/fish! Backup before running"
rm -rf "$XDG_CONFIG_HOME/fish"
ln -s (pwd) "$XDG_CONFIG_HOME/fish"

echo -e "#!/bin/sh\necho \# Fish Shell Goodies > README.md\ngenerate-readme.fish >> README.md" > .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit 
