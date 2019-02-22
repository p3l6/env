## navigation
function up { path=""; if [ $1 ]; then for i in $(seq 1 $1); do path=$path"../"; done; else path="../"; fi; cd $path; } # usage: $up 2
alias back='cd -'  # previously: 'cd $OLDPWD'
function cdl { cd $@   &&   ls -halF; } # change to a directory and print out contents
function mkcd { mkdir $@   &&  cd $@; }
alias desk='cd ~/Desktop'
alias doc='cd ~/Documents'
alias down='cd ~/Downloads'
function var { cd $WRKSP/$@/; }

eval $(thefuck --alias)

## command shortcuts
alias which='type -a'
alias dush='du -sh'
function wtf () ( shopt -s dotglob; du -shc * | sort -h; )
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias top='open -a Activity\ Monitor.app'
alias igrep='egrep -i'
alias diff='diff -u'

## ls extension
alias l='ls -halF'
alias lc='ls -halFG'

## file opening aliases
alias proj='open *.xc[ow][do][er][pk]*' # .xcodeproj or .xcworkspace
alias edit='vim'
alias readme='less *[Rr][Ee][Aa][Dd]*[Mm][Ee]*'

## cd to current finder window
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}
alias finder='cdf'
