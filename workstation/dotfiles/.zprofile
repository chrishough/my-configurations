export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/share/npm/bin

source $HOME/.myconfigurations/workstation/shell/includes

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"
