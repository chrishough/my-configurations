## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/download.svg" height="20"> Engineering Workstation Setup and Configuration : Step Three

> Please note, if you have not installed Xcode, please review the [first part of this guide](/guides/step_one_core.md) and complete those steps before starting this phase.

1. Install [homebrew](http://brew.sh/).    
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. Run `brew doctor` and make sure it reports `Your system is ready to brew`.
3. Update brew via `brew update`.
4. Install the latest version of git via `brew install git`.
5. Install [Autojump](https://github.com/wting/autojump) via `brew install autojump`.
6. Install [direnv](http://direnv.net/) to manage environment variables via `brew install direnv`.
7. Install [itermocil](https://github.com/TomAnthony/itermocil) to manage iterm windows via `brew install TomAnthony/brews/itermocil`.
8. Install [htop](http://hisham.hm/htop/) via `brew install htop`.
9. Install [wget](https://www.gnu.org/software/wget/) via `brew install wget`
10. Install the [Heroku CLI Tool](https://devcenter.heroku.com/articles/heroku-cli) via `brew install heroku/brew/heroku`.  
11. Install [NGROK](https://ngrok.com/) via `brew install --cask ngrok` from this [guide](https://gist.github.com/wosephjeber/aa174fb851dfe87e644e).  
12. Install [Git Large File Storage](https://git-lfs.github.com/) via `brew install git-lfs`.
13. Setup your `.gitconfig` file with your account information.
```
[user]
  name = Chris Hough
  email = {insert email address}
[mergetool]
  keepBackup = true
[core]
  editor = vi
[color]
  ui = auto
[push]
  default = simple
[github]
  user = chrishough
[credential]
  helper = osxkeychain
[filter "lfs"]
  process = git-lfs filter-process
  required = true
  clean = git-lfs clean -- %f
  smudge = git-lfs smudge -- %f
[pull]
  rebase = false
[init]
  defaultBranch = master
```
13. Clone this repo "git@github.com:chrishough/my-configurations.git" to our home directory. Please note, that if 
you are having cloning issues you may 
need to setup your [new ssh keys](https://help.github.com/enterprise/11.10.340/user/articles/generating-ssh-keys/) 
then run `git clone git@github.com:chrishough/my-configurations.git .myconfigurations`.
14. Setup Alfred theme and workflows brought in from the `.myconfigurations` repo in the folder `.myconfigurations/workstation/alfred/`.  
    * ![alfred](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/alfred/alfred1.png)  
    * ![alfred](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/alfred/alfred2.png)  
15. Install the [Fira Code Fonts](https://fonts.google.com/specimen/Fira+Code).
16. Install [tmux](https://github.com/tmux/tmux/wiki) via `brew install tmux`.
17. Install [Zsh](http://www.zsh.org/) via`brew install zsh`.
18. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) `sh -c "$(curl -fsSL https://raw.
githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`.
19. Now need to set zsh as the default shell.  If you run `which zsh` you will see this pointed to `/bin/zsh`. We need to change this.  Running `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh` will properly adjust this for us. Now reopen the terminall window, and when you run `which zsh` it should be pointed to `/usr/local/bin/zsh`.
20. Setup [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md) via 
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`.