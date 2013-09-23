export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin

[[ -s `brew --prefix`/etc/autojump.bash ]] && . `brew --prefix`/etc/autojump.bash

source $HOME/.myconfigurations/settings/.setup

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi
