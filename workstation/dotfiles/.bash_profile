source $HOME/.myconfigurations/workstation/shell/includes

if [[ `uname -m` == 'arm64' ]]; then
    # NOT USED FOR M1 MACHINES IN VERSION 7.0.0
else
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin

    if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

    if [ -f $(brew --prefix)/etc/bash_completion ]; then
     . $(brew --prefix)/etc/bash_completion
    fi
fi