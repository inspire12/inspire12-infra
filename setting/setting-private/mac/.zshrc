if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/Applications/Docker.app/Contents/Resources/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
git
#  git-flow-completion
#  autojump
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
  fasd
  alias-tips
  web-search
  kubectl
  tmux)

source $ZSH/oh-my-zsh.sh

RPROMPT='%D{%L:%M:%S} '$RPROMPT

export JAVA_HOME_8=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
export JAVA_HOME_14=/Library/Java/JavaVirtualMachines/temurin-14.jdk/Contents/Home
export JAVA_HOME_17=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
export JAVA_HOME_GRAAL=/Library/Java/JavaVirtualMachines/graalvm-ce-java17-22.3.0/Contents/Home
export JAVA_HOME_21=/Users/yeonghakseo/Library/Java/JavaVirtualMachines/corretto-21.0.3/Contents/Home


export JAVA_HOME=$JAVA_HOME_17

alias j17="export JAVA_HOME=$JAVA_HOME_17"
alias j14="export JAVA_HOME=$JAVA_HOME_14"
alias j8="export JAVA_HOME=$JAVA_HOME_8"
alias j21="export JAVA_HOME=$JAVA_HOME_21"


eval "$(pyenv init -)"
export ENV=LOCAL

alias work="cd /Users/yeonghakseo/Documents/workspace"
alias faipt="/Users/yeonghakseo/Documents/workspace/faipt"
alias python="python3"
source /Users/yeonghakseo/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/yeonghakseo/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/yeonghakseo/.oh-my-zsh/custom/themes/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export KUBECONFIG=~/.kube/config:~/.kube/config_cloud:~/.kube/config_faipt:~/.kube/config_faip_dev:~/.kube/config_faip_real:~/.kube/config_fim:~/.kube/config-faip-dev-new
alias docker="/Applications/Docker.app/Contents/Resources/bin/docker"
alias docker-compose="/Applications/Docker.app/Contents/Resources/bin/docker-compose"
alias kubectl="/Applications/Docker.app/Contents/Resources/bin/kubectl"
alias k="kubectl"

eval "$(zoxide init zsh)"
# init starship
eval "$(starship init zsh)"

alias ls='logo-ls'
alias la='logo-ls -A'
alias ll='logo-ls -al'
# equivalents with Git Status on by Default
alias lsg='logo-ls -D'
alias lag='logo-ls -AD'
alias llg='logo-ls -alD'

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y
export PATH="/Users/username/anaconda/bin:$PATH"

eval "$(atuin init zsh)"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
source ~/.bash_profile

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#/opt/homebrew/anaconda3/bin/conda init zsh
#alias kubectl="minikube kubectl --"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

