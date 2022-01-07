## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/installation.svg" height="20"> Install Additional Software : Step Two

1. Install [AlfredApp](https://www.alfredapp.com/).
2. Set the Alfred launch shortcut to `cmd + spacebar`.
3. In `System Preferences` in the `Keyboard` under `Shortcuts` disable all Spotlight keyboard shortcuts.
4. In `System Preferences` under `Notifications` adjust notifications to your liking. I disable all of them.
5. Download and Install [Chrome](https://www.google.com/chrome/browser/desktop/index.html), [Firefox](https://www.mozilla.org/en-US/firefox/new/), and [Brave](https://github.com/chrishough/my-configurations).
6. Install the 1Password Package into all browsers.
7. Setup Google and Brave Synced Extensions.
8. Make Brave the default browser.
9. Setup the `TMP` directory on the desktop and make sure all browser downloads default to this folder.
10. Download and Install [Grammarly](https://www.grammarly.com/desktop).
11. Send screenshots to the Desktop's `TMP` folder via: `defaults write com.apple.screencapture location /Users/christopherhough/Desktop/TMP` followed by `killall SystemUIServer`.
12. Install iMovie, iPhoto, Keynote, Numbers, Pages, GarageBand, FaceTime from the `App Store`.
13. In the `Terminal` application run `defaults write com.apple.iCal "n days of week" 14` to set the osx calendar to 
display 14 days in week view.
14. Install [Evernote](https://evernote.com/) from the `App Store`. Open after to configure.
15. Install Skitch [Skitch](https://evernote.com/products/skitch) from the `App Store`. Open after to configure.
16. Install [Harvest](https://www.getharvest.com/) from the `App Store`. Open after to configure.
17. Install [Slack](https://slack.com) from the `App Store`. Open after to configure.
18. Install [Office for Mac](https://www.microsoft.com/en-us/store/b/office).
19. Install [Divvy](http://mizage.com/divvy/), and set to open via `cmd + shift + space`.
20. Configure Divvy Shortcuts.  
    * ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy1.png)
    * ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy2.png)
    * ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy3.png)
21. Install [Keyboard Maestro](https://www.keyboardmaestro.com/main/).
22. Install [Total Finder](https://totalfinder.binaryage.com/).
23. Install [iTerm2](https://www.iterm2.com/).
24. Install [Dropbox](https://www.dropbox.com).
25. Install [Caffeine](http://lightheadsw.com/caffeine/). 
    * ![caffeine](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/caffeine/caffeine-1.png)
26. Install [Transmit](https://panic.com/transmit/).
27. Install [Pathfinder](https://cocoatech.com/).
28. Install [Istat Menus](https://bjango.com/mac/istatmenus/).
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-1.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-2.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-3.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-4.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-5.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-6.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-7.png)
    * ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-8.png)
29. Install [Bartender](https://www.macbartender.com/).  
    * ![bartender](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/bartender/bartender-1.png)  
    * ![bartender](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/bartender/bartender-2.png)  
30. Setup `OSX Messages` for all accounts. Verify non-apple users too.
31. Setup the `Today` Panel.
    * ![workstation](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/workstation/osx-notifications-panel.png)
32. Install Haystack Software's [Arq](https://www.arqbackup.com/download/) backup software, and configure it to hook up to S3.  
33. Organize the applications in the `Finder` panel alphabetically. 


> If this is a migration of an existing computer, now is the time to bring over each folder and back them up to a new S3 bucket with a new IAM user, and new bucket policy. Once all of the files have been updated, reformat the old machine and sell it. Use a tough eraser i.e. `diskutil secureErase freespace 3 /Volumes/DRIVE` via https://www.backblaze.com/blog/how-to-wipe-a-mac-hard-drive/   

![arq](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/arq/arq-1.png)



