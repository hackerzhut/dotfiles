alias reload!='. ~/.zshrc'

alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

alias rm="rm -i"  # safety first
alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias sandbox="cd ~/codebase/sandbox"
alias tc="cd ~/codebase/tabcorp"
alias wp="cd ~/codebase/tabcorp/web-parts"
alias sb="cd ~/codebase/tabcorp/www-sunbets"
alias tab="cd ~/codebase/tabcorp/www-tab"
alias silks="cd ~/codebase/tabcorp/api-service-silks"
alias info="cd ~/codebase/tabcorp/api-service-info-wagerplayer"
alias wfd="cd ~/codebase/tabcorp/wfd-consumer"
alias nm="nodemon | bunyan -o short"
alias wps="node -f app.js | bunyan -o short"
alias g="git"
alias h="history"
alias j="jobs"
alias v="vim"
alias m="mate ."
alias s="subl ."
alias o="open"
alias oo="open ."

function mcd() { mkdir -p $1 && cd $1 }
function cdf() { cd *$1*/ } # stolen from @topfunky

# Detect which `ls` flavor is in use
if gls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# # ls options: F = put `/` after falseolders, h = byte unit suffixes, color! (even with piping to awk)
alias ls='CLICOLOR_FORCE=1 gls -aFh ${colorflag} --group-directories-first'

# List ALL files (colorized() in long format, show permissions in octal
alias la="ls -l | awk '
{
  k=0;
  for (i=0;i<=8;i++)
    k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));
    if (k)
      printf(\"%0o \",k);
      printf(\" %9s  %3s %2s %5s  %6s  %s %s %s\n\", \$3, \$6, \$7, \$8, \$5, \$9,\$10, \$11);
}'"

# List only directories
alias lsd='ls -l | grep "^d"'

# Gzip-enabled `curl`
alias gurl="curl --compressed"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm update npm -g; npm update -g; sudo gem update'

# `cat` with beautiful colors. requires Pygments installed.
#    sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'

# GIT STUFF

# Undo a `git push`
alias undopush="git push -f origin HEAD^:master"

# git root
alias gr='[ ! -z `git rev-parse --show-cdup` ] && cd `git rev-parse --show-cdup || pwd`'


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# All the dig info
alias dig="dig +nocmd any +multiline +noall +answer"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""


# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# Trim new lines and copy to clipboard
alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Shortcuts
alias g="git"
alias v="vim"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"


# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# start dnsmasq
alias strdnsmasq="sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"

# stop
alias stpdnsmasq="sudo launchctl unload /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist"

# restart dnsmasq
alias rsdnsmasq="sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq"

# Open chrome with disable security
alias chromeds="open -a /Applications/Google\ Chrome\ Canary.app --args --disable-web-security --user-data-dir"

# Time for coffee
alias kohi="cat /dev/urandom | hexdump -C | grep 'ca fe'"

# Apps using internet at this time
alias iapps='lsof -P -i -n | cut -f 1 -d " "| uniq | tail -n +2'

# All ports with PIDs
alias ports="lsof -Pan -i tcp -i udp"

# Tmux Shortcuts
# alias mux='TERM=xterm-256color mux'
alias mux="tmuxinator $1"
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"
