alias ls='ls -F'
alias l='ls'
alias ll='ls -al'

alias gs='git status'

source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/git-completion.bash

read c1 c2 c3 <<< $(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{c1 = total % 6; c2 = (c1 + 1 + total % 4) % 7; c3 = (c2 + 1 + total % 3) % 7; print 31 + c1, 31 + c2, 31 + c3}')

PS1='\[\e[${c1}m\]\h\[\e[00m\]:\[\e[${c2}m\]\w\[\e[${c3}m\]$(__git_ps1)\[\e[00m\] '

if [ -f ~/.bashenv ]; then
    source ~/.bashenv
fi

