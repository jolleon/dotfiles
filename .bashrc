alias ls='ls -F'
alias l='ls'
alias ll='ls -al'

alias gs='git status'

source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/git-completion.bash


# Fancy colors depending on hostname
_HOST_SEED=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print total}')
_HOST_COLORS=($(echo $_HOST_SEED | awk '{ srand($1);
for(i=0;i<6;i++){
    c[i]=31+i
}
for(i=0;i<5;i++){
    j=i+int(rand()*(6-i));
    tmp=c[i];
    c[i]=c[j];
    c[j]=tmp;
    print c[i]
};
print c[5] }'))


# Function to show active conda environment in PS1
# with flashy bg color if env doesn't match current repo based on PWD
# (assumes conda env names match repo dir names)
function __condaEnv {
if [ $CONDA_DEFAULT_ENV ]; then
    if [[ $PWD =~ .*/${CONDA_DEFAULT_ENV}(/.*|$) ]]; then
        c="${_HOST_COLORS[3]}"
    else
        c="${_HOST_COLORS[3]};7"
    fi
    echo -en " \001\033[${c}m\002[$CONDA_DEFAULT_ENV]\001\033[27m\002"
fi
}


PS1='\[\e[${_HOST_COLORS[0]}m\]\h\[\e[00m\]:\[\e[${_HOST_COLORS[1]}m\]\w$(__condaEnv)\[\e[${_HOST_COLORS[2]}m\]$(__git_ps1)\[\e[00m\] '


if [ -f ~/.bashenv ]; then
    source ~/.bashenv
fi

# conda env shortcuts
alias actenv='source activate ${PWD##*/}'
alias deact='source deactivate'

# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
