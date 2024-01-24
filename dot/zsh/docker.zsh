alias docker-all-stop='docker stop $(docker ps -q -f "status=running")'
alias docker-all-start='docker start $(docker ps -q -f "status=exited")'
alias docker-all-pause='docker pause $(docker ps -q -f "status=running")'
alias docker-all-resume='docker unpause $(docker ps -q -f "status=paused")'
