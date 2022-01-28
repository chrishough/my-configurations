source $HOME/.myconfigurations/workstation/shell/includes

if [[ `uname -m` == 'arm64' ]]; then
   # NOT USED FOR M1 MACHINES IN VERSION 7.0.0
else
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/share/npm/bin

    if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
fi