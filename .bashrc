alias ls='ls -F'
alias l='ls'
alias ll='ls -al'

alias gs='git status'
alias cdw='cd ~/ring/web'

source ~/.dotfiles/git-prompt.sh

PS1='\[\e[34m\]\h\[\e[00m\]:\[\e[33m\]\w\[\e[31m\]$(__git_ps1)\[\e[00m\] '


export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_OPTS="-Xms1024M -Xmx8192M"
export SBT_OPTS="$JAVA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=127.0.0.1:9999 -Dsbt.override.build.repos=true"


PATH=~/bin:$PATH:~/activator-1.3.2-minimal

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="$PATH:/Applications/Muse"

export DYLD_FALLBACK_LIBRARY_PATH="$DYLD_FALLBACK_LIBRARY_PATH:/Applications/Muse"
