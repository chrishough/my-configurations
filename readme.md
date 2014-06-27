### My Workstation
----
I have found every developer's workstation configuration to be highly variable and tailored to their exact desires.  Whatever makes the person tick right?  I tend to spend a chunk of time each month tuning my box for maximum efficiency, and just like the quantified self movement this is my guide tracking the updates.  In a nutshell this is how I [grok, trunk, and live](href="http://www.youtube.com/watch?v=Qi_AAqi0RZM) each and every day. I believe in being part cyborg actually and rarely unplug, however, that is a totally different story.

If you want to keep up with my rants hit me up on twitter [@chrishough](http://twitter.com/chrishough), and check out my blog [noconformity](http://noconformity.com).

### Assumptions
----
* The workstation is running the latest production release of [Apple OSX](http://www.apple.com/osx/).
* The latest release of [Xcode](https://developer.apple.com/xcode/) has been installed with the developer command line tools.
* [Homebrew](http://brew.sh/) has been successfully installed.
* Running ```brew doctor``` does not report any configuration issues.
* [Google Chrome](http://www.google.com/chrome) is your primary development browser.
* [rbenv](https://github.com/sstephenson/rbenv) is how you are running ruby locally, pre-installed.
* Although not required for this guide I use the [Adobe Creative Cloud](http://www.adobe.com/) for all of my design related tasks.
* If you use [Alfred](http://www.alfredapp.com/) workflows and themes, check out [my configurations](https://github.com/chrishough/myconfigurations/tree/master/software/alfredapp/).
* I would fork this repo to your github account so you can build off it and tailor it to your needs.


### rbenv plugins
----
* [rbenv-default-gems](https://github.com/sstephenson/rbenv-default-gems): This rbenv plugin hooks into the rbenv install command to automatically install gems every time you install a new version of Ruby.
* [rbenv-gem-rehash](https://github.com/sstephenson/rbenv-gem-rehash): Never run rbenv rehash again. This rbenv plugin automatically runs rbenv rehash every time you install or uninstall a gem.
* [rbenv-vars](https://github.com/sstephenson/rbenv-vars): This is a plugin for rbenv that lets you set global and project-specific environment variables before spawning Ruby processes.
* [rbenv-use](https://github.com/rkh/rbenv-use): This rbenv plugin allows easier switching between Ruby versions without having to keep patch levels in mind.
* [rbenv-whatis](https://github.com/rkh/rbenv-whatis): This rbenv plugin resolves abbreviations and aliases to full Ruby version identifiers. It is mainly intended to be used by other plugins, such as rbenv-use.
* [ruby-build](https://github.com/sstephenson/ruby-build): ruby-build is an rbenv plugin that provides an rbenv install command to compile and install different versions of Ruby on UNIX-like systems.
* [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs): This plugin makes rbenv transparently aware of project-specific binstubs created by bundler. This means you don't have to type bundle exec ${command} ever again!

### Setup Shell
----
1. Download and install [iterm2](http://www.iterm2.com).  This shell will be configured to replace the default bash and adjust terminal.
2. Follow the guide to install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) which will give you access to a vast amount of themes.
3. Once the themes finish installing make sure to run ```chsh -s /bin/zsh``` to set zsh as your default shell.
4. ```brew install autojump``` [Autojump](https://github.com/joelthelion/autojump) memorizes your favorite locations and allows you to quickly navigate to a path from anywhere in your shell.
5. ```brew install the_silver_searcher``` [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) replaces ack and is by far the fastest search utility I have used.


### Setup Shell Theme
----
![shell-theme-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-example.png)

* Download and install the following font files: [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) and [Sauce Code Powerline Regular](https://github.com/Lokaltog/powerline-fonts).

* In your shell ```cd``` to your home directory and type ```nano .zshrc``` to edit the zsh configuration file. Comment out the previous theme ```#ZSH_THEME="robbyrussel"``` by adding a ```#``` in front of it. Once you have commented out the default theme, add the next block after it.  This enables the new theme, however, please make sure to adjust the ```DEFAULT_USER``` to match your osx username.

```
ZSH_THEME="agnoster"
DEFAULT_USER="chrishough"
```

* Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors, and import them under the colors panel in iterm2 preferences. My theme uses ```base16-railscasts.dark``` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.

![shell-theme-iterm-colors-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-colors-example.png)

* Under the terminal tab, make sure to change the report terminal type to ```xterm-256color``` and your character encoding to ```Unicode (UTF-8)```.

![shell-theme-iterm-terminal-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/alfred-screenshots/shell-theme-iterm-terminal-example.png)

* The background image I created can be found [here](https://github.com/chrishough/myconfigurations/raw/master/assets/terminal/Terminal.png).  Once attached as the background you will notice a red box around your shell window.  This will all become clearer when you hook up my [Sublime Text](http://www.sublimetext.com/3) ```vader``` style theme.

![shell-theme-iterm-window-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-window-example.png)

***
####HOUGH WORKSTATION BUILDER
***
*Before attempting this setup, please review the assumptions!*

1: In your shell ```cd``` to your home directory and download my setup.

```
git clone git@github.com:chrishough/myconfigurations.git .myconfigurations
```








***
**UNDER CONSTRUCTION**
***

### Setup Base Configuration
----


### Setup Atom as my Text Editor
----
* Download and install [Atom](https://atom.io).
* Using Package Control install these plugins.
* Considering ATOM is being rapidly developed I encourage you to join their [discuss forums](http://discuss.atom.io/).
	* Zen
	* Atom Dark UI
	* Atom Handlebars
	* Atom Prettify
	* Autocomplete Paths
	* Autocomplete Plus
	* Emmet
	* Gist It
	* Slim Language
	* Maximize Panes
	* Move Panes
	* Open Within System
	* Pretty Json
	* Resize Panes
	* Rspec
	* Rspec Snippets
	* Ruby Slim
	* Terminal


### Run the Machine Builder [Experimental]
----

This setup will backup your existing configuration files and hook up the various text editor configurations,
application mappings, sets of my favorite functions and utilities, and a few other goodies.  Use this setup
at your own risk, and if you run into bugs please let me know.

* These system and shell files are affected by this build:
  * .zprofile
  * .zshrc
  * .gemrc
  * .gitconfig
  * .bash_profile
  * .bashrc
  * .vimrc
  * .profile

To execute the build ```cd``` to your home directory and type the following:

```
	cd .myconfigurations
	sh buildsystem.sh
```

When you kick off the build system script it will process the following:

1. mkdir .myconfigurations-backups.
2. make backup copies.
3. remove installed copies.
4. create symlinks to my configurations.
