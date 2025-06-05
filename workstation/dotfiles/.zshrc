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
plugins=(colorize node npm autojump macos zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#disable auto correct
unsetopt correct_all

source $HOME/.myconfigurations/workstation/shell/includes

# Test for Apple Silicon...
if [[ `uname -m` == 'arm64' ]]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
else
    homebrew=/usr/local/bin:/usr/local/sbin
    export PATH=$homebrew:$PATH
    export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
    export PATH="/usr/local/opt/qt/bin:$PATH"
    export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
    export PATH="/usr/local/sbin:$PATH"
    export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
    export PATH="/usr/local/opt/python/libexec/bin:$PATH"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

eval "$(direnv hook zsh)"

# Hide Direnv Output in the Shells...
# https://stackoverflow.com/questions/51349012/stop-direnv-showing-all-environment-variables-on-load
export DIRENV_LOG_FORMAT=

# For osx machines fix the alt + arrow functionality
bindkey -e; bindkey '\e\e[C' forward-word; bindkey '\e\e[D' backward-word

# Loads the correct version of node via nvm
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# Windsurf Requirement
export PATH="$HOME/.codeium/windsurf/bin:$PATH"
