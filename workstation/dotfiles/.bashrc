if [[ `uname -m` == 'arm64' ]]; then
    # SAVED FOR REFERENCE
else
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi