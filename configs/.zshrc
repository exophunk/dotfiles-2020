export USER=exophunk
export DOTFILES=$HOME/.dotfiles
export ZSH=${USER}/.oh-my-zsh
export LANG=de_CH.UTF-8
export UPDATE_ZSH_DAYS=5
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_GITHUB_API_TOKEN="82c663414c9b2c7f60118f0a1ecb955feaf3997a"

DISABLE_UPDATE_PROMPT=true
ZSH_THEME="af-magic"
HIST_STAMPS="dd.mm.yyyy"

# Enable completions
autoload -Uz compinit && compinit

# Disable autocorrection
unsetopt correct_all

# zsh-nvm options
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true

# Load more ZSH Config files
ZSH_CUSTOM=$DOTFILES/configs/zsh

plugins=(
    git
    zsh-nvm
    # git-extras
    # dircycle
    # dirhistory
    # dirpersist
    # history-substring-search
    # last-working-dir
)

source $ZSH/oh-my-zsh.sh

