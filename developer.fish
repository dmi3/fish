#  Functions useful for developers  
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

alias git-show-unpushed-commits='git cherry -v' 

alias ccat='pygmentize -g'

function git-revert-file --description "Revert single file in git"
  git reset HEAD $argv; git checkout $argv
end

function gradle --description "Use ./gradlew if exists"
  if test -e ./gradlew
    ./gradlew $argv
  else
    eval (which gradle) $argv
  end
end

function src --description "Open/edit source of script located in $PATH" --wraps which
  gedit (which $argv)
end