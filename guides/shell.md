## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/toolbox.svg" height="20"> Shell Configuration

Type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

1. First we will clone this repo to our home directory. Please note, that if you are having cloning issues you may need to setup your [new ssh keys](https://help.github.com/enterprise/11.10.340/user/articles/generating-ssh-keys/).  
`git clone git@github.com:chrishough/my-configurations.git .myconfigurations`
2. Install the [Fira Code Fonts](https://github.com/tonsky/FiraCode).
3. Download and install [iterm2](https://www.iterm2.com/version3.html).  This will normally be dropped into your downloads directory. Like all Apple OS applications make sure to drag this to the applications directory.
4. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
5. Install [Zsh](http://www.zsh.org/) and set it as the default shell.  
`brew install zsh`
6. Now need to set zsh as the default shell.  If you run `which zsh` you will see this pointed to `/bin/zsh`. We need to change this.  Running `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh` will properly adjust this for us. Now reopen the terminall window, and when you run `which zsh` it should be pointed to `/usr/local/bin/zsh`.
7. Setup [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).  
`
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
`

Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.  Also, if iterm prompts you for an update. Load it.  Also, make sure to check `load updates automatically` during this process.  Please feel free to close `Terminal` at this time.

1. Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors to your documents directory. My theme uses `base16-railscasts.dark` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.
2. Under the terminal tab, make sure to change the report terminal type to `xterm-256color` and your character encoding to `Unicode (UTF-8)`.
3. Set the scrollback lines to unlimited.

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm1.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm2.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm3.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm4.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm5.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm6.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm7.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm8.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm9.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm91.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm92.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm93.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm94.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm95.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm96.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm97.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm98.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm99.png)
![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/iterm/iterm991.png)

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

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20170623/iterm/user_directory.png)
