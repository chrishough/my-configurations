#### My Workstation
-----
I have found every developer's workstation configuration to be highly variable and tailored to their exact desires.  Whatever makes the person tick right?  I tend to spend a chunk of time each month tuning my box for maximum efficiency, and just like the quantified self movement this is my guide tracking the updates.  In a nutshell this is how I [grok, trunk, and live](href="http://www.youtube.com/watch?v=Qi_AAqi0RZM) each and every day. I believe in being part cyborg actually and rarely unplug, however, that is a totally different story. 

If you want to keep up with my rants hit me up on twitter [@chrishough](http://twitter.com/chrishough), and check out my blog [noconformity](http://noconformity.com).

#### Assumptions
-----
* The workstation is running the latest production release of [Apple OSX](http://www.apple.com/osx/).
* The latest release of [Xcode](https://developer.apple.com/xcode/) has been installed with the developer command line tools.
* [Homebrew](http://brew.sh/) has been successfully installed.
* Running ```brew doctor``` does not report any configuration issues.


#### Setup Shell
-----
1. Download and install [iterm2](http://www.iterm2.com).  This shell will be configured to replace the default bash and adjust terminal.
2. Follow the guide to install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) which will give you access to a vast amount of themes. 
3. Once the themes finish installing make sure to run ```chsh -s /bin/zsh``` to set zsh as your default shell.
4. ```brew install autojump``` [Autojump](https://github.com/joelthelion/autojump) memorizes your favorite locations and alows you to quickly navigate to a path from anywhere in your shell.
5. ```brew install the_silver_searcher``` [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) replaces ack and is by far the fastest search utility I have used.


#### Shell Theme
-----
![My Current Theme](https://github.com/chrishough/myconfigurations/blob/master/assets/settings/shellThemeExample.png)



1. Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors









------------
------------

This setup will backup your existing configuration files and hook up various text editor configurations,
application mappings, sets of my favorite functions and utilities, and a few other goodies.  Use this setup
at your own risk, and if you find bugs please let me know in git or ping me on twitter @chrishough.

[Grok - Trunk - Live](http://www.youtube.com/watch?v=Qi_AAqi0RZM&feature=share)

---


* [Google Chrome](http://www.google.com/chrome) is your primary development browser.
* [Sublime Text 3](http://www.sublimetext.com/3) is your text editor for coding pre-installed.
* [rbenv](https://github.com/sstephenson/rbenv) is how you are running ruby locally, pre-installed.

* I have numerous applications running on [heroku](https://www.heroku.com) so I have a system's file for this service.
* My blog is running on [octopress](http://octopress.org/) so I have a system's file for this service.
* If you have ```private``` configurations you can use the ```settings/private``` file to omit them from the git repository.
* [iterm2](http://www.iterm2.com/) is my primary terminal, pre-installed.
* These system and shell files are affected by this build:
  * .zprofile
  * .zshrc
  * .gemrc
  * .gitconfig
  * .bash_profile
  * .bashrc
  * .vimrc
  * .profile
* These application files are affected by this build:
  * Preferences.sublime-settings
  * Default (OSX).sublime-keymap


---

Let's start by getting the manual steps out of the way first:

1. open terminal
2. cd $home
3. mkdir .myconfigurations
4. cd .myconfigurations
5. git clone git@github.com:chrishough/myconfigurations.git .
6. sh buildsystem.sh

When you kick off the build system script it will process the following:

1. cd $home
2. mkdir .myconfigurations-backups
3. make backup copies
4. remove installed copies
5. create symlinks to my configurations
6. close terminal


