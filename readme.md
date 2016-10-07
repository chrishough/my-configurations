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

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/toolbox.svg" height="20"> Software


* [Atom](https://atom.io/)
* [iterm2](http://www.iterm2.com)
* [Zsh](http://www.zsh.org/) + [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Postgres App](http://postgresapp.com/)
* [Autojump](https://github.com/joelthelion/autojump)
* [Paw](https://luckymarmot.com/paw)
* [Pathfinder](http://cocoatech.com/pathfinder/)
* [Arq](http://www.haystacksoftware.com/arq/) + [Amazon S3](https://aws.amazon.com/s3/)
* [Cloak](https://www.getcloak.com/)
* [Dash](http://kapeli.com/dash)
* [Divvy](https://mizage.com/divvy/)
* [Adobe Creative Cloud](http://www.adobe.com/)

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/installation.svg" height="20"> Install

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

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/rubyonrails.svg" height="25"> Ruby

This installation utilizes [rbenv](https://github.com/rbenv/rbenv) to run ruby. If you are ok with that, let's type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory.

1. Setup [Ruby](https://www.ruby-lang.org/en/) via `brew install rbenv rbenv-build`
2. Following the guide on the [repo](https://github.com/rbenv/rbenv) run `rbenv init` and then `eval "$(rbenv init -)"`. This will create the .rbenv directory.
3. Create the rbenv plugin directory `mkdir $(rbenv root)/plugins`.
4. Install [rbenv-default-gems](https://github.com/rbenv/rbenv-default-gems) plugin via `git clone https://github.com/rbenv/rbenv-default-gems.git $(rbenv root)/plugins/rbenv-default-gems`.
5. Install [rbenv/rbenv-gem-rehash](https://github.com/rbenv/rbenv-gem-rehash) plugin via `git clone https://github.com/sstephenson/rbenv-gem-rehash.git $(rbenv root)/plugins/rbenv-gem-rehash`
6. Install [rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin via `git clone https://github.com/rbenv/rbenv-vars.git $(rbenv root)/plugins/rbenv-vars`
7. Install [rbenv-binstubs](https://github.com/ianheggie/rbenv-binstubs) plugin via `git clone https://github.com/ianheggie/rbenv-binstubs.git $(rbenv root)/plugins/rbenv-binstubs`
8. Install [rbenv-update](https://github.com/rkh/rbenv-update) plugin via `git clone https://github.com/rkh/rbenv-update.git $(rbenv root)/plugins/rbenv-update`
9. Install a few common versions of ruby. At the time of this build the following versions were installed: `rbenv install 2.3.0` and `rbenv install 2.3.1`.  Please note you can run `rbenv install -l` to see the current versions available.
