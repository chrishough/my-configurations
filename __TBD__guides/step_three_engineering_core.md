## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/download.svg" height="20"> Engineering Workstation Setup and Configuration : Step Three















> Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.  Also, if iterm prompts you for an update. Load it.  Also, make sure to check `load updates automatically` during this process.  Please feel free to close `Terminal` at this time.






### Potential Errors...

If you get the error `zsh compinit: insecure directories, run compaudit for list.` you will need to adjust zsh permissions as desribed in this [stackoverflow post](http://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories).
```
cd /usr/local/share/
sudo chmod -R 755 zsh
sudo chown -R root:staff zsh
```

If you see this error regarding NVM this will be installed during the next parts of this guide.
```
/Users/christopherhough/.zprofile:.:8: no such file or directory: /usr/local/opt/nvm/nvm.sh
```

At this point if you type `cd $HOME && lsa` your home directory should look something like this.
![iterm](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/iterm/user_directory.png)
