## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/toolbox.svg" height="20"> Shell Configuration

Type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

2. 






Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.  Also, if iterm prompts you for an update. Load it.  Also, make sure to check `load updates automatically` during this process.  Please feel free to close `Terminal` at this time.

1. Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors to your documents directory. My theme uses `base16-railscasts.dark` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.
2. Under the terminal tab, make sure to change the report terminal type to `xterm-256color` and your character encoding to `Unicode (UTF-8)`.
3. Set the scrollback lines to unlimited.

![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm1.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm2.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm3.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm4.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm5.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm6.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm7.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm8.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm9.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm91.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm92.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm93.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm94.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm95.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm96.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm97.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm98.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm99.png)
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/iterm991.png)

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
