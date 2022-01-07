## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/toolbox.svg" height="20"> Shell Configuration

Type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

2. 









Now we have to sync our settings to the configuration repo! This will adjust the following files: .pryrc, .vimrc, .zprofile, .zshrc, .profile, .gemrc, .bashrc, and .bash_profile.

1. Backup existing dotfiles.  
`ruby $HOME/.myconfigurations/scripts/setup/dotfiles/backup.rb`
2. Setup symlinks to our configuration dotfiles.  
`ruby $HOME/.myconfigurations/scripts/setup/dotfiles/symlinks.rb`
3. If you get the error `zsh compinit: insecure directories, run compaudit for list.` you will need to adjust zsh permissions as desribed in this [stackoverflow post](http://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories).
```
cd /usr/local/share/
sudo chmod -R 755 zsh
sudo chown -R root:staff zsh
```

Verify global rbenv vars are setup correctly. Type `nano $HOME/.rbenv/vars` and confirm the following. Adjust if necessary. Once completed, type `rbenv vars` and you should see `export GEM_PATH='.bundle'`.
```
#GLOBAL
GEM_PATH=.bundle
```

At this point if you type `cd $HOME && lsa` your home directory should look like this.

![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/user_directory.png)
