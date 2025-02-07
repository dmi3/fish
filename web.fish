#  Calls to various CLI friendly web services
#  
#  Author: [Dmitry](http://dmi3.net) [Source](https://github.com/dmi3/fish)#

#  * `myip` Shows external ip
alias myip='curl ifconfig.co'

#  * `localip` Shows (local) internal ip
# alternative would be `ifdata -pa eth0` from moreutils
alias localip="ip -o route get to 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'"

#  * `whereami` is like whoami but shows your external ip and geolocation
alias whereami='curl ifconfig.co/json'

function random-name --description "Random name for registration on random websites. How about Helen Lovick? Roger Rice?"
  curl -s "https://randomuser.me/api/" | jq -r '.results[0].name.first + " " + .results[0].name.last'
end

function random-alias --description "Docker-like alias generator: `thirsty_mahavira`, `boring_heisenberg`. Don't know how to name file/project/branch/file? Use this!"
  curl -s https://frightanic.com/goodies_content/docker-names.php | tee /dev/tty | xclip -sel clip; and echo -e "\ncopied to clipboard"
end

function random-email --description "Random email for registration on random websites. Generate random email in one of Mailinator subdomains and provide link to check it. Useful when <http://bugmenot.com/> is not available."
  set domain (echo -e \
"notmailinator.com
veryrealemail.com
chammy.info
tradermail.info
mailinater.com
suremail.info
reconmail.com" | shuf -n1)
  set name (curl -s "https://randomuser.me/api/" | jq -r '.results[0].name.first + .results[0].name.last')
  set email $name@$domain
  printf "$email" | tee /dev/tty | xclip -sel clip
  echo -e "\ncopied to clipboard\nhttps://www.mailinator.com/v4/public/inboxes.jsp?to=$name"
end 

function duckmails --description "Duck Mails! Woo-oo! Private Duck Address Generator"
    if not test -f "$HOME/keys/duck"
        echo "File at ~/keys/duck should contain token from dev tools on https://duckduckgo.com/email/"
        return 1
    end
    curl -s -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.3" 'https://quack.duckduckgo.com/api/email/addresses' -X POST -H "authorization: Bearer "(cat ~/keys/duck) -H 'content-type: application/json' | jq -r '.address + "@duck.com"' | tr -d '\n' | xclip -sel clip
    echo "Duck Mails! Woo-oo! (copied to clipboard):"
    echo (xclip -sel clip -o)
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

function syn --description "Find synonyms for word"
  test -e ~/git/stuff/keys/bighugelabs || echo "Get API key at https://words.bighugelabs.com/account/getkey and put in "(status --current-filename)
  curl http://words.bighugelabs.com/api/2/(cat ~/git/stuff/keys/bighugelabs)/$argv/
end

function waitweb --description 'Wait until web resource is available. Useful when you are waiting for internet to get back, or Spring to start' --argument-names 'url'
  set -q url || set url 'google.com'
  printf "Waithing for the $url"
  while not curl --output /dev/null --silent --head --fail "$url"
    printf '.'
    sleep 10
  end
  printf "\n$url is online!"
  notify-send -u critical "$url is online!"
end

function uselessfact --description "Print random useless fact. Makes checking if internet is awailable little less boring"
  curl -s https://uselessfacts.jsph.pl/api/v2/facts/random | jq .text
end

#  * `xkcd` Print color-adjusted xkcd in your terminal! See <https://developer.run/40>
alias xkcd='curl -sL https://c.xkcd.com/random/comic/ | grep -Po "https:[^\"]*" | grep png | xargs curl -s | convert -negate -fuzz 10% -transparent black png: png:- | kitty +kitten icat'

#  * `albumart` Show hi-res album art of currently playing song in Spotify
#    - Requires [sp](https://gist.github.com/wandernauta/6800547)
alias albumart='sp metadata | grep -Po "(?<=url\|).*" | xargs curl -s | grep -Po "https:[^\"]*" | grep "i.scdn.co/image/" | head -1 | xargs curl -s | kitty +kitten icat'

function virustotal --description "Check file hash by virustotal.com"
  test -e ~/git/stuff/keys/virustotal || echo "Get API key at https://www.virustotal.com/gui/my-apikey and put in "(status --current-filename)
  curl -sL --request GET \
  --url https://www.virustotal.com/api/v3/files/(sha256sum $argv | cut -f 1 -d " ") \
  --header "x-apikey: "(cat ~/git/stuff/keys/virustotal) \
  | jq ".data .attributes .last_analysis_stats, .data .attributes .tags, .data .attributes .total_votes"
end


