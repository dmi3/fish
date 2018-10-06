#  Functions useful for developers  
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

alias git-show-unpushed-commits='git cherry -v' 

alias ccat='pygmentize -g'

function git-revert-file --description "Revert single file in git"
  git reset HEAD $argv; git checkout $argv
end

function git-wat --description "Show 5 latest commits"
  git log --pretty="format:%s" --abbrev-commit  HEAD~5..HEAD
end

function gradle --description "Use ./gradlew if exists"
  if test -e ./gradlew
    ./gradlew $argv
  else
    eval (which gradle) $argv
  end
end

function src --description 'Open/edit source of script or function located in $PATH' --wraps which
  switch (functions --details $argv)
    case '-'
      gedit (grep -rwI "alias $argv" ~/.config/fish/* | string split ":" | head -n 1)
    case 'n/a'
      gedit (which $argv)
    case '*'
      gedit (functions --details $argv)
  end
end

function td --description "Add to ~/todo.md list"
  echo -e "\n- [ ] $argv" >> ~/todo.md
end