# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="agnoster"

ZSH_THEME="robbyrussell"
DEFAULT_USER="chrishough"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git ruby rails colorize node npm autojump bundler osx vim zsh-syntax-highlighting)
plugins=(colorize node npm autojump osx vim zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#disable auto correct
unsetopt correct_all

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $HOME/.myconfigurations/workstation/shell/includes

eval "$(direnv hook zsh)"

# For osx machines fix the alt + arrow functionality
bindkey -e; bindkey '\e\e[C' forward-word; bindkey '\e\e[D' backward-word

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
