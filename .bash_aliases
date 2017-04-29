# general
alias c="clear"
alias ch="cd ~"
alias ..="cd ..;"

# git
alias gs="git status"
alias ga="git add -u"
alias gd="git diff --staged"
alias gb="git branch"


function grepr()
{
	grep -nr "$1" .
}


