#  Calls to varios Web services
#  
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)#

# Shows external ip
alias myip='curl ifconfig.co'

# Like whoami but shows your external ip and geolocation
alias whereami='curl ifconfig.co/json'

function random-name
  curl www.pseudorandom.name
end

function random-email --description "Copy random email in one of Mailinator subdomains and provide link to check it"
  set domain (echo -e \
"notmailinator.com
veryrealemail.com
chammy.info
tradermail.info
mailinater.com
suremail.info
reconmail.com" | shuf -n1)
  set email (curl -s www.pseudorandom.name | string replace ' ' '')@$domain
  printf "$email" | tee /dev/tty | xclip -sel clip
  echo -e "\ncopied to clipboard\nhttps://www.mailinator.com/inbox2.jsp?public_to=$email"
end 

function random-password --description "Generate random password" --argument-names 'length'
  test -n "$length"; or set length 13
  head /dev/urandom | tr -dc "[:alnum:]~!#\$%^&*-+=?./|" | head -c $length | tee /dev/tty | xclip -sel clip; and echo -e "\ncopied to clipboard"
end

function weather --description "Show weather"
  resize -s $LINES 125
  curl wttr.in/$argv
end

function xsh --description "Prepend this to command to explain its syntax i.e. `xsh iptables -vnL --line-numbers`"
  w3m -o confirm_qq=false "http://explainshell.com/explain?cmd=$argv"
  # replace w3m to any browser like chrome
end

function transfer --description "Upload file to transfer.sh"
  curl --progress-bar --upload-file $argv https://transfer.sh/(basename $argv)   
end

# https://github.com/dmi3/bin/blob/master/yandex-translate.sh
function translate
  translate-yandex.sh "$argv"
end