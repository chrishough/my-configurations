export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin

[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

source $HOME/.myconfigurations/settings/.setup

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
