## navigation
alias back='cd -'
alias dotfiles='cd ~/var/env'
alias tmp='cd ~/tmp'
function mkcd { mkdir $@   &&  cd $@; }

if type thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

## command shortcuts
alias which='type -a'
alias dush='du -sh'
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias diff='diff -u'

## search shortcuts
alias igrep='egrep -i'
alias rgi='rg -i'
alias rgall='rg --no-ignore --hidden'
alias rgiall='rg -i --no-ignore --hidden'
alias fdall='fd --no-ignore --hidden'

## ls extension
alias l='ls -halF'
alias lc='ls -halFG'

## file opening aliases
alias proj='open *.xc[ow][do][er][pk]*' # .xcodeproj or .xcworkspace
alias edit='vim'
alias readme='less *[Rr][Ee][Aa][Dd]*[Mm][Ee]*'
alias env-edit="code $DOTFILES"
