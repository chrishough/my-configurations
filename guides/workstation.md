## <img src="https://cdn.jsdelivr.net/gh/chrishough/my-public-data/my-configurations/download.svg" height="20"> Engineering Workstation Setup and Configuration

1. Type `cmd + space` and launch `Xcode`. This should install additional required components and will prompt you for the license approval.
2. Reboot the workstation.
3. In Terminal install `xcode-select --install`: this will confirm that xcode developer tools are properly installed.
4. `sudo xcodebuild -license accept`: this will confirm that the xcode eula has been approved.
5. Install [homebrew](http://brew.sh/).    
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
6. Run `brew doctor` and make sure it reports `Your system is ready to brew`.
7. Update brew via `brew update`.
8. Install the latest version of git via `brew install git`.
9. Install [Autojump](https://github.com/wting/autojump) via `brew install autojump`.
10. Install [direnv](http://direnv.net/) to manage environment variables via `brew install direnv`.
11. Install [itermocil](https://github.com/TomAnthony/itermocil) to manage iterm windows via `brew install TomAnthony/brews/itermocil`.
12. Install [htop](http://hisham.hm/htop/) via `brew install htop`.
13. Install [wget](https://www.gnu.org/software/wget/) via `brew install wget`
14. Install the [Heroku CLI Tool](https://devcenter.heroku.com/articles/heroku-cli) via `brew install heroku/brew/heroku`.  
15. Install [NGROK](https://ngrok.com/) via `brew cask install ngrok` from this [guide](https://gist.github.com/wosephjeber/aa174fb851dfe87e644e).  

If this is a reformat from a backup make sure to setup your `.gitconfig` file.
```
[user]
  name = Chris Hough
  email = {insert email address}
[mergetool]
  keepBackup = true
[core]
  editor = code -- wait
[color]
  ui = auto
[push]
  default = simple
[github]
  user = chrishough
[credential]
  helper = osxkeychain
```
