## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/installation.svg" height="20"> Setup a New or Reformatting an Existing Apple Workstation

> If you need to reinstall the operating system follow "[How to install macOS](https://support.apple.com/en-us/HT204904)" from the Apple Support documentation.



TODO: 
- update image of folder preferences: advanced and sidebar #26
- add shush screen shot of settings #33
- add dock screen shot of settings #10
- add caffeine screen shot of settings #47
- upgrade omnigraffle to version 7!
- add bartender screen shots of settings #52
- add istat menus screen shots settings #50
- add arqscreen shots settings #56




1. Power up the new machine, then reboot into the system utilities. Here wipe and reformat the drive completely removing the shipped install. 
2. Reinstall the latest version of OSX. 
3. Make sure that FileVault and drive encryption are enabled and activated.
4. Install [1Password](https://1password.com/) and sync via personal cloud repo, not icloud.
5. Connect to our Wifi.
6. Setup icloud mail accounts that are sycned across all Apple Devices.
7. Install all of the latest OSX updates including full operating system releases.
8. Remove every application icon from the dock except finder on the bottom left, and the trash can on the bottom right.
9. Remove `Siri`, `Display Mirroring`, and `Date & Time` from the top navigation bar.
10. Set the dock to magnify with cursor hover, and show / hide across the bottom.
11. In `Displays` set "Resolution" to `scaled` and select `more space`.
12. In `System Preferences` under the `Trackpad` disable `Natural` scrolling.
13. In `System Preferences` under the `Trackpad` under `Point and Click` set the tracking speed to `6`.
14. In `Accessibility` under `Display` set the cursor size to `2`.
15. In `Accessibility` under `Captions` set to `Large Text`.
12. In `System Preferences` in the `Keyboard` under `Shortcuts` disable all Spotlight keyboard shortcuts.
13. Install [AlfredApp](https://www.alfredapp.com/).
14. Set the Alfred launch shortcut to `cmd + spacebar`.
15. Install the full `Xcode` developer package from the Apple App Store. `=>` I use the full package because it comes with both the gcc compiler and emulators for iOS devices. These come in handy for testing responsive websites and applications.
16. Open Xcode, accept the license agreement.
17. Open Xcode, install all iOS Emulators.
18. Configure `Hot Corners` and `Mission Control`.
  ![hot-corners](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/hot-corners.png)
  ![mission-control](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/mission-control.png)
19. In the `Keyboard` settings make sure to check `Use the F1, F2, as standard function keys`.
20. In the `Energy Savor` set display to turn off after 30 minutes, and uncheck `Put hard disks to sleep when possible` and `Prevent computer from sleeping automatically when display is off`.
21. Setup `4 - 12 OSX Spaces` via `Mission Control`.
22. In `System Preferences` in the `Keyboard` under `Shortcuts` in `Mission Control` desktop switches to use `ctrl + #` for the first 4 spaces.
23. In `Finder` preferences only show `Hard Discs` on the desktop, and set new finder windows to open with `user home directory`.
24. Use `Show View Options` on the desktop set the icon size to `68 x 68` and `Snap to Grid`.
25. In Finder `View` to `Show Path Bar` which will display the full folder path at the bottom of a finder window.
26. Setup / Verify Folder Preferences.
  ![folder-prefrences](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/folder-preferences.png)
  ![folder-prefrences](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/folder-preferences.png)
27. Download and Install [Chrome](https://www.google.com/chrome/browser/desktop/index.html) and [Firefox](https://www.mozilla.org/en-US/firefox/new/).
28. Install the 1Password Package into Firefox and Chrome.
29. Setup Google Chrome Profile, and organize extensions synced from google.
30. Make Google Chrome the default browser.
31. Setup the `TMP` directory on the desktop and make sure all browser downloads default to this folder.
32. Install iMovie, iPhoto, Keynote, Numbers, Pages, GarageBand, FaceTime from the `App Store`.
33. Install [Shush](http://mizage.com/shush/) from the `App Store`. Open after to configure. 
  ![folder-prefrences](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/folder-preferences.png)
34. Install [Evernote](https://evernote.com/) from the `App Store`. Open after to configure.
35. Install Skitch [Skitch](https://evernote.com/products/skitch) from the `App Store`. Open after to configure.
36. Install [Paprika](https://www.paprikaapp.com/) from the `App Store`. Open after to configure.
37. Install [Harvest](https://www.getharvest.com/) from the `App Store`. Open after to configure.
38. Install [Ommwriter](https://ommwriter.com/) from the `App Store`. Open after to configure.
39. Install [Slack](https://slack.com) from the `App Store`. Open after to configure.
40. Install [Office for Mac](https://www.microsoft.com/en-us/store/b/office).
41. Install [Divvy](http://mizage.com/divvy/), and set to open via `cmd + shift + space`.
42. Configure Divvy Shortcuts.  
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy1.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy2.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy3.png)
43. Install [Keyboard Maestro](https://www.keyboardmaestro.com/main/).
44. Install [Total Finder](https://totalfinder.binaryage.com/).
45. Install [iTerm2](https://www.iterm2.com/).
46. Install [Dropbox](https://www.dropbox.com).
47. Install [Caffeine](http://lightheadsw.com/caffeine/).
48. Install [Transmit](https://panic.com/transmit/).
49. Install [Pathfinder](https://cocoatech.com/).
50. Install [Istat Menus](https://bjango.com/mac/istatmenus/).
51. Install [Omnigraffle](https://www.omnigroup.com/omnigraffle).
52. Install [Bartender](https://www.macbartender.com/).
53. Send screenshots to the Desktop's `TMP` folder via: `defaults write com.apple.screencapture location /Users/christopherhough/Desktop/TMP` followed by `killall SystemUIServer`.
54. Set the osx calendar to display 14 days in week view via `defaults write com.apple.iCal "n days of week" 14`.
55. Setup `OSX Messages` for all accounts. Verify non-apple users too.
56. In `System Preferences` under `Notifications` set `do not disturb` from 12:00AM to 11:59PM.

56. Install Haystack Software's [Arq](https://www.arqbackup.com/download/) backup software, and configure it to hook up to S3.



















67. Setup the `Today` Panel.
  ![workstation](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/osx-notifications-panel.png)
68. Setup the `Finder` Panel.
  ![workstation](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/osx-finder-panel.png)






57. Follow the [Engineering Work Setup and Configuration](/guides/workstation.md) guide.
58. Follow the [Ruby Engineering Configuration](/guides/ruby.md) guide.
59. Follow the [JavaScript Engineering Configuration](/guides/js.md) guide.
60. Follow the [Shell Configuration](/guides/shell.md) guide.
61. Setup Alfred theme and workflows brought in from the `.myconfigurations` repo.
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/alfred/alfred1.png)
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/alfred/alfred2.png)
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/alfred/alfred3.png)
62. Follow the [IDE Configuration](/guides/ide.md) guide.
63. Follow the [Database Configuration](/guides/database.md) guide.
64. Install the [Heroku CLI Tool](https://devcenter.heroku.com/articles/heroku-cli) via `brew install heroku/brew/heroku`.
65. Install [NGROK](https://ngrok.com/) via this [guide](https://gist.github.com/wosephjeber/aa174fb851dfe87e644e).


