alias ls='ls -F'
alias l='ls'
alias ll='ls -al'

alias gs='git status'
alias cdw='cd ~/ring/web'

source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/git-completion.bash

if [[ `hostname` == Juless-MBP* ]]
then
    c1=34
    c2=33
    c3=31
else
    read c1 c2 c3 <<< $(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{c1 = total % 6; c2 = (c1 + 1 + total % 4) % 7; c3 = (c2 + 1 + total % 3) % 7; print 31 + c1, 31 + c2, 31 + c3}')
fi

PS1='\[\e[${c1}m\]\h\[\e[00m\]:\[\e[${c2}m\]\w\[\e[${c3}m\]$(__git_ps1)\[\e[00m\] '


export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_OPTS="-Xms1024M -Xmx8192M"
export SBT_OPTS="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=127.0.0.1:9999 -Dsbt.override.build.repos=true"


PATH=~/bin:$PATH:~/activator-1.3.2-minimal

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:/Applications/Muse"

export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"
