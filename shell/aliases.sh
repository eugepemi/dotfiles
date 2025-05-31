# Enable aliases to be sudo’ed
alias sudo='sudo '

alias ll="lsd -l"
alias la="lsd -la"
alias ls="lsd"

# Git
alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gca="git add --all && git commit --amend --no-edit"
alias gs="git status"
alias gitmas="git stash && git checkout master && git fetch origin --prune && git rebase origin/master && git stash pop"

# Utils
alias k=kubectl
alias cat=bat
alias o.="open ."
alias top="htop -s PERCENT_MEM"
alias stree="du --max-depth=n -h | sort --human-numeric-sort"
alias python="python3"