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
* I would fork this repo to your github account so you can build off it and tailor it to your needs.

### Software
----

* [Atom](https://atom.io/), [iterm2](http://www.iterm2.com/#/section/home), [Zsh](http://www.zsh.org/), [Postgres App](http://postgresapp.com/), for development.
* [Evernote](http://evernote.com/) for notes and local documentation.
* [Mou](http://mouapp.com/) for editing markdown files.
* [Colloquy](http://colloquy.info/) for IRC.
* [Paw](https://luckymarmot.com/paw) for API testing and construction. 
* [Pathfinder](http://cocoatech.com/pathfinder/) for a finder on steroids.
* [Arq + S3](http://www.haystacksoftware.com/arq/) for encrypted cloud backup.
* [Cloak](https://www.getcloak.com/) for cloud based VPN.
* [Dash](http://kapeli.com/dash) for local documentation.
* [Divvy](https://mizage.com/divvy/) for osx window management.
* [Adobe Creative Cloud](http://www.adobe.com/) for designs, mainly AI and Photoshop.
* [Alfred](http://www.alfredapp.com/) workflows! Here are a helpful list of the [workflows I use](https://github.com/chrishough/myconfigurations/tree/master/software/alfredapp/community.md) and list of [workflows I built](https://github.com/chrishough/myconfigurations/tree/master/software/alfredapp/noconformity.md).
* [Keyboard Maestro](http://www.keyboardmaestro.com/main/) macros. [Find my setup here](https://github.com/chrishough/myconfigurations/tree/master/software/maestro/noconformity.md).
* [iStat Menus](http://bjango.com/mac/istatmenus/) for system performance monitoring.


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

**1**: Download and install the following font files: [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) and [Sauce Code Powerline Regular](https://github.com/Lokaltog/powerline-fonts).

**2**: In your shell ```cd``` to your home directory and type ```nano .zshrc``` to edit the zsh configuration file. Comment out the previous theme ```#ZSH_THEME="robbyrussel"``` by adding a ```#``` in front of it. Once you have commented out the default theme, add the next block after it.  This enables the new theme, however, please make sure to adjust the ```DEFAULT_USER``` to match your osx username.

```
ZSH_THEME="agnoster"
DEFAULT_USER="chrishough"
```

**3**: Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors, and import them under the colors panel in iterm2 preferences. My theme uses ```base16-railscasts.dark``` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.

![shell-theme-iterm-colors-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-colors-example.png)

**4**: Under the terminal tab, make sure to change the report terminal type to ```xterm-256color``` and your character encoding to ```Unicode (UTF-8)```.

![shell-theme-iterm-terminal-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-terminal-example.png)

**5**: The background image I created can be found [here](https://github.com/chrishough/myconfigurations/raw/master/graphics/terminal-background.png).  Once attached as the background you will notice a red box around your shell window.  

![shell-theme-iterm-window-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-window-example.png)

***
####HOUGH WORKSTATION BUILDER
***
*Before attempting this setup, please review the assumptions!*

**1**: In your shell ```cd``` to your home directory and download my setup.

```
git clone git@github.com:chrishough/myconfigurations.git .myconfigurations
```

**2**: Download and install [Atom](https://atom.io).
**3**: Using Package Control install these plugins.

![shell-theme-iterm-window-example](https://github.com/chrishough/myconfigurations/raw/master/graphics/shell-screenshots/shell-theme-iterm-window-example.png)



