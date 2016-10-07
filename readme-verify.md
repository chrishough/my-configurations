
### Software
----

* [Atom](https://atom.io/): Atom is a text editor that's modern, approachable, yet hackable to the core—a tool you can customize to do anything but also use productively without ever touching a config file.


* [Postgres App](http://postgresapp.com/): The easiest way to get started with PostgreSQL on the Mac


* [Paw](https://luckymarmot.com/paw): For API testing and construction.
* [Pathfinder](http://cocoatech.com/pathfinder/): For a finder on steroids.
* [Arq + S3](http://www.haystacksoftware.com/arq/): For encrypted cloud backup.
* [Cloak](https://www.getcloak.com/): For cloud based VPN.
* [Dash](http://kapeli.com/dash): For local documentation.
* [Divvy](https://mizage.com/divvy/): For osx window management.
* [Adobe Creative Cloud](http://www.adobe.com/):
For design things, primarily Ai and Photoshop.
* [Alfred](http://www.alfredapp.com/): Alfred is an award-winning app for Mac OS X which boosts your efficiency with hotkeys and keywords. Search your Mac and the web effortlessly, and control your Mac using customised actions with the Powerpack.
  * [Community Workflows](https://github.com/chrishough/my-configurations/tree/master/software/alfredapp/community.md)
  * [Hough Workflows](https://github.com/chrishough/my-configurations/tree/master/software/alfredapp/studio.md)
* [Keyboard Maestro](http://www.keyboardmaestro.com/main/): The leading software for Mac OS X automation. It will increase business productivity by using macros(or short cuts) with simple keystrokes.
  * [Hough Maestro Macros](https://github.com/chrishough/my-configurations/tree/master/software/maestro/studio.md).
* [iStat Menus](http://bjango.com/mac/istatmenus/): System performance monitoring.

### Dot Files
----
[.bash_profile](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.bash_profile)  
[.bashrc](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.bashrc)  
[.gemrc](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.gemrc)  
[.profile](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.profile)  
[.pryrc](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.pryrc)  
[.vimrc](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.vimrc)  
[.zprofile](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.zprofile)  
[.zshrc](https://github.com/chrishough/my-configurations/blob/master/workstation/dotfiles/.bash_profile)  

### Shell Shortcuts
----
[includes](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/includes): This is the base file to pull in all the includes.   
[global-helpers](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/global-helpers): Controls that apply to all of the inlcudes.   
[global-settings](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/global-settings): Machine and include settings.   
[app](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/app):  Applications that do not require their own includes file.   
[git](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/git):  Github shortcuts and workflows.  
[heroku](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/heroku):  Heroku shortcuts and workflows.    
[keybase](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/keybase): Keybase shortcuts and workflows.   
[ruby](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/ruby):  Ruby and Rails based commands.   
[shell](https://github.com/chrishough/my-configurations/blob/master/workstation/shell/shortcuts/shell):  Everything shell..  



### Atom Packages
----
I use the [Inconsolata](http://levien.com/type/myfonts/inconsolata.html) font for development.

Via `Package Control` these are my favorite packages:  

* [atom-alignment](https://github.com/Freyskeyd/atom-alignment)
* [atom-auto-update-packages](https://github.com/yujinakayama/atom-auto-update-packages)
* [emmet-atom](https://github.com/emmetio/emmet-atom)
* [file-icons](https://github.com/DanBrooker/file-icons)
* [atom-glowing-cursor](https://github.com/Matthew-Smith/atom-glowing-cursor)
* [indent-guide-improved](https://github.com/harai/indent-guide-improved)
* [language-haml](https://github.com/ezekg/language-haml)
* [language-slim](https://github.com/slim-template/language-slim)
* [maximize-panes](https://github.com/santip/maximize-panes)
* [move-panes](https://github.com/santip/move-panes)
* [pretty-json](https://github.com/federomero/pretty-json)
* [remote-sync](https://github.com/yongkangchen/remote-sync)
* [set-syntax](https://github.com/lee-dohm/set-syntax)
* [atom-tabularize](https://github.com/pcasaretto/atom-tabularize)
* [atom-trailing-spaces](https://github.com/wpillar/atom-trailing-spaces)


### New Machine Checklist
----

6. brew install postgres
7. brew install nvm

9. install postgresapp from postgresapp.com
10. copy ~/.gitconfig and ~/.ssh to new computer


18. download and install atom
19. install atom plugins
20. setup atom theme, keymap.cson, and config.cson files

23. make sure each dotfile exists, if it does not create it
24. symlink the current dotfiles to the git versions via ruby settings/symlinks.rb

27. make sure to setup rbenv vars
28. run brew doctor to make sure there are no errors
30. install [java](http://support.apple.com/kb/DL1572)
31. cd into scripts and run ruby backup.rb
32. cd into scripts and run ruby symlinks.rb

...*Time to drink beer!*

![open-source-projects.jpeg](https://github.com/chrishough/my-configurations/raw/master/graphics/open-source-projects.jpeg)
