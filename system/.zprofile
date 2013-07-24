export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin

source /users/chrishough/.includes/include-mappers

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
