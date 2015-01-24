export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/usr/local/share/npm/bin

[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

source $HOME/.myconfigurations/workstation/shell/includes

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

source $(brew --prefix nvm)/nvm.sh
