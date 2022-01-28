if [[ `uname -m` == 'arm64' ]]; then
    # NOT USED FOR M1 MACHINES IN VERSION 7.0.0
else
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi