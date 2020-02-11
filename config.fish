#  Entry point that includes all other configs
#  
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME "$HOME/.config"

source $XDG_CONFIG_HOME/fish/main.fish
source $XDG_CONFIG_HOME/fish/colors.fish
source $XDG_CONFIG_HOME/fish/aliases.fish
source $XDG_CONFIG_HOME/fish/developer.fish
source $XDG_CONFIG_HOME/fish/prompt.fish
source $XDG_CONFIG_HOME/fish/web.fish