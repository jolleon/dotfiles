alias ls='ls -F'
alias l='ls'
alias ll='ls -al'

alias gs='git status'

source ~/.dotfiles/git-prompt.sh
source ~/.dotfiles/git-completion.bash


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


PS1='\[\e[90m\]\t\[\e[00m\] \[\e[${_HOST_COLORS[0]}m\]\h\[\e[00m\]:\[\e[${_HOST_COLORS[1]}m\]\w$(__condaEnv)\[\e[${_HOST_COLORS[2]}m\]$(__git_ps1)\[\e[00m\] '


if [ -f ~/.bashenv ]; then
    source ~/.bashenv
fi

# conda env shortcuts
alias actenv='source activate ${PWD##*/}'
alias deact='source deactivate'

# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc

export PATH=~/.local/bin:$PATH


K_REALMS=(dev staging prod paloalto)
function k {
    if [[ ! ${K_REALMS[*]} =~ "$1" ]]; then
        echo "env must be one of: ${K_REALMS[*]}"
        return
    fi
    kubectl config set current-context $1.k8s.people.ai
    kubectl config current-context
    case $2 in
        p)
            pod=`kubectl get pods | grep $3 | cut -d ' ' -f1`
            echo "Port-forwarding $4 to $pod..."
            (sleep 2; /usr/bin/open -a "/Applications/Google Chrome.app" "http://localhost:$4") &
            while true
                do kubectl port-forward $pod $4
            done
            ;;
        *)
            echo Unknown option: "$2"
            ;;
    esac
}
