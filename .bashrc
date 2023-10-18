# Basic aliases
alias ls='ls -F'
alias l='ls'
alias ll='ls -al'


# Fancy colors depending on hostname
_HOST_SEED=$(hostname | od | tr ' ' '\n' | awk '{total = total + $1}END{print total}')
_HOST_COLORS=($(echo $_HOST_SEED | awk '{ srand($1);
for(i=0;i<4;i++){
    c[i]=33+i
}
for(i=0;i<3;i++){
    j=i+int(rand()*(4-i));
    tmp=c[i];
    c[i]=c[j];
    c[j]=tmp;
    print c[i]
};
print c[3] }'))

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

# prompt with conda:
# PS1='\[\e[90m\]\t\[\e[00m\] \[\e[${_HOST_COLORS[0]}m\]\h\[\e[00m\]:\[\e[${_HOST_COLORS[1]}m\]\w$(__condaEnv)\[\e[${_HOST_COLORS[2]}m\]$(__git_ps1)\[\e[00m\] '

PS1='\[\e[90m\]\t\[\e[00m\] \[\e[${_HOST_COLORS[0]}m\]\h\[\e[00m\]:\[\e[${_HOST_COLORS[1]}m\]\w\[\e[${_HOST_COLORS[2]}m\]$(__git_ps1)\[\e[00m\] '


# Make Git better
alias gs='git status'
source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/git-completion.bash


# Make Docker better
alias dclean="docker ps -a | tail +2 | cut -d ' ' -f1 | xargs docker rm"
alias dkill="docker ps -a | tail +2 | cut -d ' ' -f1 | xargs docker stop"


alias jupyter='docker run --rm -v `pwd`:/home/jovyan/work  -p 8888:8888 jupyter/scipy-notebook:17aba6048f44'

# make sure ipython uses the local venv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# put machine dependent confis in .bashenv
if [ -f ~/.bashenv ]; then
    source ~/.bashenv
fi
