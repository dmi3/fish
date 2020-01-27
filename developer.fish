#  Functions useful for developers  
#
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)

alias ccat='pygmentize -g'

alias git-show-unpushed-commits='git cherry -v' 

function git-revert-file --description "Revert single file in git"
  git reset HEAD $argv; git checkout $argv
end

function git-wat --description "Show 5 latest commits"
  git log --pretty="format:%s" --abbrev-commit  HEAD~5..HEAD
end

function git-pr --description "Create PR on Github"
  set from   (git config --get remote.origin.url | string match --regex "\:(.*)/" | tail -1)
  set to     (git config --get remote.oss.url | string match --regex "\:(.*)\.git" | tail -1)
  set branch (git rev-parse --abbrev-ref HEAD)
  
  xdg-open "https://github.com/$to/compare/master...$from:$branch?expand=1"
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

alias copy-patch='echo (cd ~/safe/patches; ls -t | head -10 | fzf | xargs cat | xclip -sel clip)'

alias server-here='python -m SimpleHTTPServer 8080'

function sdkman --description "sdkman"
  bash -c "source ~/.sdkman/bin/sdkman-init.sh; sdk $argv"
  sdkman-init
end

function sdkman-init --description "Inits sdkman"
  test -e ~/.sdkman/bin/sdkman-init.sh || begin echo "You need to install sdkman" && commandline -a "curl -s https://get.sdkman.io | bash" 2>/dev/null && return 1; end
  set -gx PATH (bash -c "source ~/.sdkman/bin/sdkman-init.sh; echo \$PATH")
end

# Set `SDKMAN_AUTO_INIT=true` in `/etc/profile` for auto init
set -q SDKMAN_AUTO_INIT && sdkman-init