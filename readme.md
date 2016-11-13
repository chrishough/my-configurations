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

This guide is highly opinionated. If you have any questions please post an issue. I am open to pull requests. Finally, this guide is supposed to read from top to bottom. If you are following this advice, please read it like *following the yellow brick road*, and have fun.  

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

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/rubyonrails.svg" height="20"> Setup Ruby

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
2. Install the [Fira Code Fonts](https://github.com/tonsky/FiraCode).
3. Download and install [iterm2](https://www.iterm2.com/version3.html).  This will normally be dropped into your downloads directory. Like all Apple OS applications make sure to drag this to the applications directory.
4. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
5. Install [Zsh](http://www.zsh.org/) and set it as the default shell.  
`brew install zsh`
6. Following this [guide](sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh) we need to set zsh as the default shell.  If you run `which zsh` you will see this pointed to `/bin/zsh`. We need to change this.  Running `sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh` will properly adjust this for us. Now when you run `which zsh` it should be pointed to `/usr/local/bin/zsh`.
7. Setup [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md).  
`
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
`


Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.  Also, if iterm prompts you for an update. Load it.  Also, make sure to check `load updates automatically` during this process.  Please feel free to close `Terminal` at this time.

1. Download the [Base16 iTerm2](https://github.com/chriskempson/base16-iterm2) colors to your documents directory. My theme uses `base16-railscasts.dark` which can be loaded in the presets.  You will need to set the contrast as shown to have a clearer definition of the font icons.
2. My theme uses a custom background image which can be downloaded [here](https://github.com/chrishough/my-configurations/raw/master/graphics/terminal-background.png) or extracted from the repo you cloned..  If you need to view hidden files use `cmd + shift + period` described [here](http://osxdaily.com/2011/03/01/show-hidden-files-in-mac-os-x-dialog-boxes-with-commandshiftperiod/).
3. Under the terminal tab, make sure to change the report terminal type to `xterm-256color` and your character encoding to `Unicode (UTF-8)`.
4. Set the scrollback lines to unlimited.

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/1.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/2.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/3.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/4.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/8.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/5.png)

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/6.png)

Now we have to sync our settings to the configuration repo! This will adjust the following files: .pryrc, .vimrc, .zprofile, .zshrc, .profile, .gemrc, .bashrc, and .bash_profile.

1. Backup existing dotfiles.  
`ruby $HOME/.myconfigurations/scripts/setup/dotfiles/backup.rb`
2. Setup symlinks to our configuration dotfiles.  
`ruby $HOME/.myconfigurations/scripts/setup/dotfiles/symlinks.rb`
3. If you get the error `zsh compinit: insecure directories, run compaudit for list.` you will need to adjust zsh permissions as desribed in this [stackoverflow post](http://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories).
```
cd /usr/local/share/
sudo chmod -R 755 zsh
sudo chown -R root:staff zsh
```

Verify global rbenv vars are setup correctly. Type `nano $HOME/.rbenv/vars` and confirm the following. Adjust if necessary. Once completed, type `rbenv vars` and you should see `export GEM_PATH='.bundle'`.
```
#GLOBAL
GEM_PATH=.bundle
```

At this point if you type `cd $HOME && lsa` your home directory should look like this.

![iterm](https://github.com/chrishough/my-public-data/raw/master/my-configurations/iterm/7.png)

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/face.svg" height="20"> Shortcuts and Helpers

As you explore the configuration directories you will notice a number of shortcut files have been preloaded.  These files are described below and many come pre-built with their own helpers.  I encourage you to personalize these as you see fit and make sure you understand what each git function does before blindly using them.

| File  | Helper Command | Description  |
|---|:---:|---|
|[includes](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/includes)| |This is the base file to pull in all the includes.|
|[global-helpers](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/global-helpers)| |Controls that apply to all of the inlcudes.|
|[global-settings](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/global-settings)| |Machine and include settings.|
|[app](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/app)| apphelp | Applications that do not require their own includes file.|
|[git](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/git)| githelp | Github shortcuts and workflows.|
|[heroku](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/heroku)| herokuhelp | Heroku shortcuts and workflows.|
|[keybase](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/keybase)| keybasehelp |Keybase shortcuts and workflows.|
|[ruby](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/ruby)| rubyhelp | Ruby and Rails based commands.|
|[shell](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/shell)| shellhelp | Everything shell.|

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/ide.svg" height="20"> IDE

I have used a variety of editors over the years including homesite, dreamweaver, eclipse, vim, sublime text, sublime text 2, and atom.  My current build utilizes [atom](https://atom.io/) to get the job done, and I have been working with it since beta.  No, it is not as fast as an engineer who has mastered the vim keyboard but it comes pretty darn close.

1. Download and install [atom](https://atom.io/). This will normally be dropped into your downloads directory. Like all Apple OS applications make sure to drag this to the applications directory.
2. Type `cmd + space` to launch `Atom` to approve the EULA. Once approved, close the application.
3. Backup the existing atom configuration.  
`ruby $HOME/.myconfigurations/scripts/setup/ide/backup.rb`
4. Setup symlinks to our atom configuration files.  
`ruby $HOME/.myconfigurations/scripts/setup/ide/symlinks.rb`
5. From the command prompt type `atom` followed by `cmd + ,` and click on install. On this interface we want to search for [package-sync](https://atom.io/packages/package-sync) and install it.
6. With package-sync installed type `shift + cmd + p` and type `package-sync:sync`. This will install all of the packages inside the `package.cson` file.  Please watch the bottom of atom to see it scrolling through the installation process. Once complete please close atom and re-open it. If you do not have any errors, you are good to go.

![atom](https://github.com/chrishough/my-public-data/raw/master/my-configurations/atom.png)

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/database.svg" height="20"> Databases

Type `cmd + space` to launch `iterm2` to perform the next block of installations in your home directory. Please verify you are in your home directory by typing `cd $HOME`.

1. Type `brew tap homebrew/services` to install brew services. Thoughtbot has a great [guide](https://robots.thoughtbot.com/starting-and-stopping-background-services-with-homebrew) on this tool.
2. Run `brew install postgres` to install [PostgreSQL](https://www.postgresql.org/).
3. Start PostgreSQL via `brew services start postgres` and create your base db via the following command:
```
createdb `whoami`
```
4. If everything worked correctly you can verify this by attaching to Postgres by typing `psql`. Please note this installation of Postgres via Homebrew was adapted from [install-postgresql-on-mac-os-x-via-brew](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) and this [stackoverflow post](http://stackoverflow.com/questions/17822974/postgres-fatal-database-files-are-incompatible-with-server). Unfortunately my local copy of Postgres was borked so I rebuilt it at one point by going "nuclear" and removing everything.
```
rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres -E utf8
```
5. Run `brew install redis` to install [Redis](http://redis.io/).
6. Start Redis via `brew services start redis`

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/download.svg" height="20"> Additional Recommended Tools

* [Paw](https://luckymarmot.com/paw): API testing and construction.
* [Pathfinder](http://cocoatech.com/pathfinder/): A finder on steroids.
* [Arq](http://www.haystacksoftware.com/arq/) + [S3](https://aws.amazon.com/s3/): Encrypted cloud backup.
* [Cloak](https://www.getcloak.com/): Cloud based VPN.
* [Dash](http://kapeli.com/dash): Local documentation.
* [Divvy](https://mizage.com/divvy/): OSX window management.
* [Adobe Creative Cloud](http://www.adobe.com/): Design things, primarily Ai and Photoshop.
* [iStat Menus](http://bjango.com/mac/istatmenus/): System performance monitoring.
* [Keyboard Maestro](http://www.keyboardmaestro.com/main/): Keyboard Macros.
* [1Password](https://1password.com/): Password and 2FA security across all Apple devices.
* [Alfred](https://www.alfredapp.com/): Replace spotlight with powerful workflows.

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/alfred.svg" height="20"> Alfred Workflows

If you love automation, you will love [Alfred](https://www.alfredapp.com/)! It is basically spotlight on steroids and when you purchase the license you are granted access to infinitely complex workflows.  Here is what I have installed.

* [chrome-bookmarks](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/chrome-bookmarks.alfredworkflow): Search Chrome Bookmarks.
* [emoji-codes](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/emoji-codes.alfredworkflow): Emoji Search ([repo](https://github.com/carlosgaldino/alfred-emoji-workflow)).
* [forecast](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/.alfredworkflow): Weather Forecast ([repo](http://github.com/kejadlen/forecast.alfredworkflow)).
* [github-commands](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/github-commands.alfredworkflow): Parse Github Pages.
* [google](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/google.alfredworkflow): Google Search.
* [ip-address-info](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/ip-address-info.alfredworkflow): Retrieve Local IP Address.
* [open-text-file](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/open-text-file.alfredworkflow): Open a .txt file.
* [replace-spaces-with-hyphens](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/replace-spaces-with-hyphens.alfredworkflow): Create slugs for git flow.
* [start-ios-emulator](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/start-ios-emulator.alfredworkflow): Start the iOS Emulator.
* [timezones](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/timezones.alfredworkflow): Pull Time.
* [toggle-visibility-of-hidden-files](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/toggle-visibility-of-hidden-files.alfredworkflow): Show OSX Hidden Files.
* [urban-dictionary](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/urban-dictionary.alfredworkflow): Query the Urban Dictionary.
