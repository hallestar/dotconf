export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git python tmux svn zsh-autosuggestions autojump)


export HZC_PATH="$HOME/install/bin"
export PATH="$HZC_PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"


export PATH=$HOME/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT ]]; then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
fi

# >------------------------------------- cmd ------------------------------------------>
make_file_backup(){
    mv $1 $1.bak
}

func_find_all()
{
    find . -type f | xargs grep -wn --color $1
}

function gdbp
{
    if [[ $# -lt 1 ]]; then
        gdbp_usage
    fi

    if [[ $? != 0 ]]; then
        return
    fi

    get_progname $1
    echo $prog_name
    pid=$(ps -u $(basename $HOME) | grep $prog_name | awk '{print $1}')
    if [[ $pid == "" ]]; then
        echo "$1 not found~"
        return
    fi
    gdb -p $pid
}

function gdbp_usage
{
    echo "gdbp want 1 arg!"
    echo "  gdbp server_name"
    return 1
}
# <------------------------------------- cmd ------------------------------------------<


# >------------------------------------- alias ------------------------------------------>
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias bak=make_file_backup
alias findall=func_find_all
alias grepexp='find . -name "*.cpp" -o -name "*.h" | xargs grep --color -n -H $1'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias agpp="ag --cpp"
alias ag="ag --path-to-ignore ~/.ag/.ignore"
alias tmux="tmux -2"

# < ------------------------------------- alias ------------------------------------------<


# > ------------------------------------- env ------------------------------------------>
ulimit -c unlimited

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH 

if [[ -n $ZSH_CUSTOM ]]; then
    export ZSH_TMUX_TERM=screen
    export TERM=xterm
fi
export EDITOR='vim'

if [[ -f ~/.curlrc ]]; then
    export HOMEBREW_CURLRC=~/.curlrc
fi


if [[ -d $HOME/.cargo/bin ]]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#36c6ff,bold,underline"

# < ------------------------------------- env ------------------------------------------<

source ~/shell_config.sh

