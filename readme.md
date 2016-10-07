## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/computer.svg" height="20"> Configurations

Every engineer's workstation configuration (`dotfiles`) is highly variable and tailored to their desires, habits, and software stack. I love rebuilding and tinkering with my build by learning from and collaborating with others.  This setup is what I use to get the job done, however, don't just accept my words as gospel, find your own path when setting up your build.  

>I also think it is important to reason from first principles, rather than, by analogy. So the normal way we conduct our lives is we reason by analogy. We're doing this because it's like something else that was done or like what other people are doing. Iterations on a theme. It's kinda mentally easier to reason by analogy rather than from first principles. First principles is kinda a physics way of looking at the world and what that really means is you kinda boil things down to the most fundamental truths and say okay, what are we sure is true? or sure as possible is true? and then reason up from there. That takes a lot more mental energy. - Elon Musk Foundation 20

If you're learning to code, I hope I can save you time. I live by using linters and tools that monitor testing coverage.  Whether I am building a project for the enterprise or side project I hope to make some money on, I run these tools in real time.  I believe code quality, testing coverage, and coding styles are critical to the success and longevity of any project.

* [guard](https://github.com/guard/guard)
* [rubocop](https://github.com/bbatsov/rubocop)
* [simplecov](https://github.com/colszowka/simplecov)
* [jshint](https://github.com/stereobooster/jshintrb)
* [eshint](http://eslint.org/)
* [sass-lint](https://github.com/brigade/scss-lint)
* [credo](https://github.com/rrrene/credo)

This guide is highly opinionated. If you have any questions please post an issue. I am open to pull requests.

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/installation.svg" height="20"> Base Software Installation

This setup has been validated against OSX 10.11 and 10.12 via [VMWARE Fusion](http://www.vmware.com/products/fusion.html) :bangbang:

1. Make sure that **every** operating system update has been processed including itunes.
2. Install the full `Xcode` developer package from the Apple App Store. `=>` I use the full package because it comes with both the gcc compiler and emulators for iOS devices.These come in handy for testing responsive websites and applications.
3. Type `cmd + space` and launch `Xcode`. This should install additional required components and will prompt you for the license approval.
4. Reboot the workstation.

Type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory.

1. `xcode-select --install`: this will confirm that xcode developer tools are properly installed.
2. `sudo xcodebuild -license accept`: this will confirm that the xcode eula has been approved.
3. Install [homebrew](http://brew.sh/).    
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
4. Run `brew doctor` and make sure it reports `Your system is ready to brew`.
5. Update brew via `brew update`.
6. Install the latest version of git via `brew install git`.
7. Install [Autojump](https://github.com/wting/autojump) via `brew install autojump`.
8. Install [direnv](http://direnv.net/) to manage environment variables via `brew install direnv`.

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/rubyonrails.svg" height="25"> Setup Ruby

This installation utilizes [rbenv](https://github.com/rbenv/rbenv) to run ruby. If you are ok with that, let's type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory.

1. Setup [Ruby](https://www.ruby-lang.org/en/) via `brew install rbenv rbenv-build`
2. Following the guide on the [repo](https://github.com/rbenv/rbenv) create the `.rbenv` directory.  
`rbenv init` and then `eval "$(rbenv init -)"`.
3. Create the rbenv plugin directory `mkdir $(rbenv root)/plugins`.
4. Install [rbenv-default-gems](https://github.com/rbenv/rbenv-default-gems) plugin.    
`git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems`.
5. Install [rbenv/rbenv-gem-rehash](https://github.com/rbenv/rbenv-gem-rehash) plugin.     
`git clone https://github.com/sstephenson/rbenv-gem-rehash.git $(rbenv root)/plugins/rbenv-gem-rehash`
6. Install [rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin.    
`git clone https://github.com/rbenv/rbenv-vars.git $(rbenv root)/plugins/rbenv-vars`
7. Install [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs) plugin.  
`git clone https://github.com/ianheggie/rbenv-binstubs.git $(rbenv root)/plugins/rbenv-binstubs`
8. Install [rbenv-update](https://github.com/rkh/rbenv-update) plugin.  
`git clone https://github.com/rkh/rbenv-update.git $(rbenv root)/plugins/rbenv-update`
9. Install a few common versions of ruby. At the time of this build the following versions were installed: `rbenv install 2.3.0` and `rbenv install 2.3.1`.  Please note you can run `rbenv install -l` to see the current versions available.
10. Run `rbenv global 2.3.0` to setup the global version of ruby.


## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/toolbox.svg" height="20"> Setup Shell

Type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

1. First we will clone this repo to our home directory. Please note, that if you are having cloning issues you may need to setup your [new ssh keys](https://help.github.com/enterprise/11.10.340/user/articles/generating-ssh-keys/).  
`git clone git@github.com:chrishough/my-configurations.git .myconfigurations`
2. Install the [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) regular and bold fonts via [google fonts](https://fonts.google.com/specimen/Inconsolata?selection.family=Inconsolata).
3. Download and install [iterm2](https://www.iterm2.com/version3.html).  This will normally be dropped into your downloads directory. Like all Apple OS applications make sure to drag this to the applications directory.
4. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
5. Install [Zsh](http://www.zsh.org/) and set it as the default shell.  
`brew install zsh`
6. Following this [guide](sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh) we need to set zsh as the default shell.  If you run `which zsh` you will see this pointed to `/bin/zsh`. We need to change this.  Running `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh` will properly adjust this for us. Now when you run `which zsh` it should be pointed to `/usr/local/bin/zsh`.

Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.  Also, if iterm prompts you for an update. Load it.  Also, make sure to check `load updates automatically` during this process.  Please feel free to close `Terminal` at this time.

1. Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors to your documents directory. My theme uses `base16-railscasts.dark` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.
2. My theme uses a custom background image which can be downloaded [here](https://github.com/chrishough/my-configurations/raw/master/graphics/terminal-background.png) or extracted from the repo you cloned..  If you need to view hidden files use `cmd + shift + period` described [here](http://osxdaily.com/2011/03/01/show-hidden-files-in-mac-os-x-dialog-boxes-with-commandshiftperiod/).
3. Under the terminal tab, make sure to change the report terminal type to `xterm-256color` and your character encoding to `Unicode (UTF-8)`.
4. Set the scrollback lines to unlimited.

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/1.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/2.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/3.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/4.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/5.png)
