## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/rubyonrails.svg" height="20"> Ruby Engineering Configuration

This installation utilizes [rbenv](https://github.com/rbenv/rbenv) to run ruby. If you are ok with that, let's type `cmd + space` to launch `Terminal` to perform the next block of installations in your home directory.

1. Setup [Ruby](https://www.ruby-lang.org/en/) via `brew install rbenv`
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
9. Install a few common versions of ruby: `rbenv install 2.3.0`, `rbenv install 2.4.1`, and `rbenv install 2.5.1`.  Please note you can run `rbenv install -l` to see the current versions available.
10. Run `rbenv global 2.5.1` to setup the global version of ruby.
11. If this is a new machine migrated from an older box, make sure to copy over the `.rbenv/vars` file so you do not lose passwords.
12. Setup pre-gems for our IDE at this time: `gem install rsense`.
