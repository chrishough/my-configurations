## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/computer.svg" height="20"> Configurations

Every engineer's workstation configuration (`dotfiles`) is highly variable and tailored to their desires, habits, and software stack. I love rebuilding and tinkering with my build by learning from and collaborating with others.  This setup is what I use to get the job done, however, don't just accept my words as gospel, find your own path when setting up your build.  

>I also think it is important to reason from first principles, rather than, by analogy. So the normal way we conduct our lives is we reason by analogy. We're doing this because it's like something else that was done or like what other people are doing. Iterations on a theme. It's kinda mentally easier to reason by analogy rather than from first principles. First principles is kinda a physics way of looking at the world and what that really means is you kinda boil things down to the most fundamental truths and say okay, what are we sure is true? or sure as possible is true? and then reason up from there. That takes a lot more mental energy. - Elon Musk Foundation 20

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/face.svg" height="20"> Guides
- [Setup a New or Reformatting an Existing Apple Workstation OSX 10.13](/guides/build.md)
- [Engineering Workstation Setup and Configuration](/guides/workstation.md)
- [Ruby Engineering Configuration](/guides/ruby.md)

## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/download.svg" height="20"> Software

- Apple [Xcode](https://developer.apple.com/xcode/)
- Google [Chrome](https://www.google.com/chrome/browser/desktop/index.html)
- Mozilla [Firefox](https://www.mozilla.org/en-US/firefox/new/)
- AgileBits clear
[1Password](https://1password.com/)
- Microsoft [Office for Mac](https://www.microsoft.com/en-us/store/b/office)
- Mizage [Divvy](http://mizage.com/divvy/)
- Mizage [Shush](http://mizage.com/shush/)
- [AlfredApp](https://www.alfredapp.com/)
- Evernote [Skitch](https://evernote.com/products/skitch)
- [Evernote](https://evernote.com/)
- Bare Bones [Textwrangler](https://www.barebones.com/products/textwrangler/)
- [Slack](https://slack.com)
- Stairways [Keyboard Maestro](https://www.keyboardmaestro.com/main/)
- Binaryage [Total Finder](https://totalfinder.binaryage.com/)
- [iTerm2](https://www.iterm2.com/)
- [Dropbox](https://www.dropbox.com)
-
-
-
-
-
-
-
-

***
***
***
***
***
***
***


If you're learning to code, I hope I can save you time. I live by using linters and tools that monitor testing coverage.  Whether I am building a project for the enterprise or side project I hope to make some money on, I run these tools in real time.  I believe code quality, testing coverage, and coding styles are critical to the success and longevity of any project.

* [guard](https://github.com/guard/guard)
* [rubocop](https://github.com/bbatsov/rubocop)
* [simplecov](https://github.com/colszowka/simplecov)
* [jshint](https://github.com/stereobooster/jshintrb)
* [eslint](http://eslint.org/)
* [sass-lint](https://github.com/brigade/scss-lint)
* [credo](https://github.com/rrrene/credo)

This guide is highly opinionated. If you have any questions please post an issue. I am open to pull requests. Finally, this guide is supposed to read from top to bottom. If you are following this advice, please read it like *following the yellow brick road*, and have fun.  


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
* [Evernote](https://evernote.com/): Notes on steroids. Also the chrome web clipper plugin is great for saving articles.

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
* [datetime-format-converter](https://github.com/chrishough/my-configurations/raw/master/scripts/alfred/datetime-format-converter.alfredworkflow): Convert Time ([repo](https://github.com/mwaterfall/alfred-datetime-format-converter)).
