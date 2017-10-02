## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/installation.svg" height="20"> Engineering Workstation Setup and Configuration

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
13. If this is a reformat from a backup make sure to setup your `.gitconfig` file.
```
[user]
  name = Chris Hough
  email = {insert email address}
[mergetool]
  keepBackup = true
[core]
  editor = atom --wait
[color]
  ui = auto
[push]
  default = simple
[github]
  user = chrishough
[credential]
  helper = osxkeychain
```
