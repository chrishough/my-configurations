export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin

source $HOME/.myconfigurations/settings/.setup

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi
