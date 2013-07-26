#My Workstation Configurations: OSX

---

This setup will backup your existing configuration files and hook up various text editor configurations,
application mappings, sets of my favorite functions and utilities, and a few other goodies.  Use this setup
at your own risk, and if you find bugs please let me know in git or ping me on twitter @chrishough.

[Grok - Trunk - Live](http://www.youtube.com/watch?v=Qi_AAqi0RZM&feature=share)

---

This configuration has been built upon a few assumptions. Feel free to tailor it to your needs as required:

* [Autojump](https://github.com/joelthelion/autojump) for terminal pre-installed.
* [Google Chrome](http://www.google.com/chrome) is your primary development browser.
* [Sublime Text 3](http://www.sublimetext.com/3) is your text editor for coding pre-installed.
* [rbenv](https://github.com/sstephenson/rbenv) is how you are running ruby locally, pre-installed.
* [homebrew](http://brew.sh/) has been configured and ```brew doctor``` does not report any errors, pre-installed.
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


