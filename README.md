## My Workstation

I have found every developer's workstation configuration to be highly variable and tailored to their exact desires.  Whatever makes the person tick right?  I tend to spend a chunk of time each month tuning my box for maximum efficiency, and just like the quantified self movement this is my guide tracking the updates.  In a nutshell this is how I [grok, trunk, and live](href="http://www.youtube.com/watch?v=Qi_AAqi0RZM) each and every day. I believe in being part cyborg actually and rarely unplug, however, that is a totally different story.

If you want to keep up with my rants hit me up on twitter [@chrishough](http://twitter.com/chrishough), and check out my blog [noconformity](http://noconformity.com).

## Assumptions

* The workstation is running the latest production release of [Apple OSX](http://www.apple.com/osx/).
* The latest release of [Xcode](https://developer.apple.com/xcode/) has been installed with the developer command line tools.
* [Homebrew](http://brew.sh/) has been successfully installed.
* Running ```brew doctor``` does not report any configuration issues.
* [Google Chrome](http://www.google.com/chrome) is your primary development browser.
* [rbenv](https://github.com/sstephenson/rbenv) is how you are running ruby locally, pre-installed.
* Although not required for this guide I use the [Adobe Creative Cloud](http://www.adobe.com/) for all of my design related tasks.
* I would fork this repo to your github account so you can build off it and tailor it to your needs.


## Setup Shell

1. Download and install [iterm2](http://www.iterm2.com).  This shell will be configured to replace the default bash and adjust terminal.
2. Follow the guide to install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) which will give you access to a vast amount of themes.
3. Once the themes finish installing make sure to run ```chsh -s /bin/zsh``` to set zsh as your default shell.
4. ```brew install autojump``` [Autojump](https://github.com/joelthelion/autojump) memorizes your favorite locations and alows you to quickly navigate to a path from anywhere in your shell.
5. ```brew install the_silver_searcher``` [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) replaces ack and is by far the fastest search utility I have used.


## Setup Shell Theme

![my current shell theme](https://github.com/chrishough/myconfigurations/raw/master/assets/settings/shellThemeExample.png)

* Download and install the following font files: [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) and [Sauce Code Powerline Regular](https://github.com/Lokaltog/powerline-fonts).

* In your shell ```cd``` to your home directory and type ```nano .zshrc``` to edit the zsh configuration file. Comment out the previous theme ```#ZSH_THEME="robbyrussel"``` by adding a ```#``` in front of it. Once you have commented out the default theme, add the next block after it.  This enables the new theme, however, please make sure to adjust the ```DEFAULT_USER``` to match your osx username.

```
	ZSH_THEME="agnoster"
	DEFAULT_USER="chrishough"
```

* Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors, and import them under the colors panel in iterm2 preferences. My theme uses ```base16-railscasts.dark``` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.

![my iterm2 color settings](https://github.com/chrishough/myconfigurations/raw/master/assets/settings/shellThemeItermColorsExample.png)

* Under the terminal tab, make sure to change the report terminal type to ```xterm-256color``` and your character encoding to ```Unicode (UTF-8)```.

![my iterm2 terminal settings](https://github.com/chrishough/myconfigurations/raw/master/assets/settings/shellThemeItermTerminalExample.png)

* The background image I created can be found [here](https://github.com/chrishough/myconfigurations/raw/master/assets/terminal/Terminal.png).  Once attached as the background you will notice a red box around your shell window.  This will all become clearer when you hook up my [Sublime Text](http://www.sublimetext.com/3) ```vader``` style theme.

![my iterm2 window settings](https://github.com/chrishough/myconfigurations/raw/master/assets/settings/shellThemeItermWindowExample.png)


## Setup Base Configuration

In your shell ```cd``` to your home directory and let's get this code repo downloaded.

```
	git clone git@github.com:chrishough/myconfigurations.git .myconfigurations
```

## Setup Our Text Editor

1.	Download and install [Sublime Text 3](http://www.sublimetext.com/3), and yes pay the license fee. It's worth it.
2.	Follow the instructions and install [Package Control](https://sublime.wbond.net/installation) for Sublime.
3.	Using [Package Control](https://sublime.wbond.net/installation) install these plugins:

	* [Base16 Color Schemes](https://github.com/chriskempson/base16-textmate)
	* [Theme - Phoenix (phoenix dark red)](https://github.com/netatoo/phoenix-theme)
	* [Sublime Better CoffeeScript](https://github.com/aponxi/sublime-better-coffeescript)
	* [Emmet (PyV8)](https://github.com/sergeche/emmet-sublime)
	* [Git Gutter](https://github.com/jisaacks/GitGutter)
	* [LESS](https://github.com/danro/less-sublime)
	* [MacTerminal](https://github.com/afterdesign/MacTerminal)
	* [SASS](https://github.com/nathos/sass-textmate-bundle/)
	* [SideBarEnhancements](https://github.com/titoBouzout/SideBarEnhancements/)
	* [SLIM (ruby-slim.tmbundle)](https://github.com/slim-template/ruby-slim.tmbundle)
	* [Sublime Alignment](http://wbond.net/sublime_packages/alignment)
	* [Trailing Spaces](https://github.com/SublimeText/trailingspaces)
	* [knockdown](https://github.com/aziz/knockdown)
	* [Bracket Highlighter](https://github.com/facelessuser/BracketHighlighter/tree/BH2ST3)

**Note**: Currently [Sublime Text 3](http://www.sublimetext.com/3) is in beta, so make sure to check each of the listed plugins for Sublime Text 3 installation details.

Under Sublime Text preferences, key bindings - user, here are my settings:

```
	[
	  { "keys": ["command+shift+t"], "command": "delete_trailing_spaces" }
	]
```

Before we update the sublime preferences we need to make sure the customized theme is available. The only deviation from what was installed with the package were the gutter text colors and the gutter row highlight color.  By setting the gutter text to white and background to black, it makes copy and pastes far easier to read. In your shell ```cd``` to your home directory and type the following:


```
	cd $HOME/library/Application\ Support/Sublime\ Text\ 3/Packages
	ln -s $HOME/.myconfigurations/sublime/base16-railscasts.dark.ch.tmTheme base16-railscasts.dark.ch.tmTheme
```


Now under Sublime Text preferences, settings - user, here are my settings:

```
	{
		"auto_indent": true,
		"color_scheme": "Packages/base16-railscasts.dark.ch.tmTheme",
		"theme": "Phoenix Dark.sublime-theme",
		"detect_indentation": true,
		"fade_fold_buttons": false,
		"font_face": "Inconsolata",
		"font_size": 14.0,
		"highlight_line": false,
		"ignored_packages":
		[
			"Vintage"
		],
		"match_brackets_angle": true,
		"phoenix_color_blue": true,
		"phoenix_color_expanded_folder": true,
		"phoenix_dirty_bottom_bar": true,
		"phoenix_dirty_bottom_bar_red": true,
		"phoenix_eighties": true,
		"phoenix_highlight_current_tab": true,
		"phoenix_sidebar_tree_small": true,
		"phoenix_solid_current_tab": true,
		"phoenix_tabs_auto_width": true,
		"phoenix_tabs_large": true,
		"sublimelinter_popup_errors_on_save": true,
		"tab_size": 2,
		"trailing_spaces_save_after_trim": true,
		"trailing_spaces_trim_on_save": true,
		"translate_tabs_to_spaces": true,
		"trim_automatic_white_space": true,
		"word_wrap": false
	}
```

Now back in terminal, let's setup the system wide shortcut for sublime.

```
	sudo rm /usr/bin/subl
	sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl
```

## Run the Machine Builder


This setup will backup your existing configuration files and hook up the various text editor configurations,
application mappings, sets of my favorite functions and utilities, and a few other goodies.  Use this setup
at your own risk, and if you run into bugs please let me know.

* I have numerous applications running on [heroku](https://www.heroku.com) so I have a settings file for this service.
* If you have ```private``` configurations you can use the ```settings/private``` file to omit them from the git repository.
* My blog is running on [octopress](http://octopress.org/) so I have a settingss file for this service.
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



