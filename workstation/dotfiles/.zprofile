source $HOME/.myconfigurations/workstation/shell/includes

if [[ `uname -m` == 'arm64' ]]; then
    eval "$(rbenv init - zsh)"

    export NVM_DIR="$HOME/.nvm"
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
else
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/share/npm/bin

    if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

    export NVM_DIR="$HOME/.nvm"
    . "$(brew --prefix nvm)/nvm.sh"
fi