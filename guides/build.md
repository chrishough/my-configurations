## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/installation.svg" height="20"> Setup a New or Reformatting an Existing Apple Workstation

> If you need to reinstall the operating system follow "[How to install macOS](https://support.apple.com/en-us/HT204904)" from the Apple Support documentation.

1. Remove `Siri`, `Display Mirroring`, and `Date & Time` from the top navigation bar.
2. Connect to Local Wifi.
3. Make sure that FileVault and drive encryption are enabled and activated.
2. Install all of the latest OSX updates including full operating system releases.
3. Remove every application icon from the dock except finder on the bottom left, and the trash can on the bottom right.
4. Set the dock to magnify with cursor hover, and show / hide across the bottom.
5. In `Displays` set "Resolution" to `scaled` and select `more space`.
6. In `System Preferences` under the `Trackpad` disable `Natural` scrolling.
7. In `System Preferences` under the `Trackpad` under `Point and Click` set the tracking speed to `6`.
8. In `Accessibility` under `Display` set the cursor size to `2`.
9. In `Accessibility` under `Captions` set to `Large Text`.
10. Install [AlfredApp](https://www.alfredapp.com/).
11. Install [1Password](https://1password.com/) and sync via iCloud.
12. In `System Preferences` in the `Keyboard` under `Shortcuts` disable all Spotlight keyboard shortcuts.
13. Set the Alfred launch shortcut to `cmd + spacebar`.
14. Install the full `Xcode` developer package from the Apple App Store. `=>` I use the full package because it comes with both the gcc compiler and emulators for iOS devices. These come in handy for testing responsive websites and applications.
15. Open Xcode, accept the license agreement, and install additional components.  Close after.
16. Configure `Hot Corners` and `Mission Control`.
  ![hot-corners](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/hot-corners.png)
  ![mission-control](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/mission-control.png)
17. In the `Keyboard` settings make sure to check `Use the F1, F2, as standard function keys`.
18. In the `Energy Savor` set display to turn off after 30 minutes, and uncheck `Put hard disks to sleep when possible` and `Prevent computer from sleeping automatically when display is off`.
19. Download and Install [Chrome](https://www.google.com/chrome/browser/desktop/index.html) and [Firefox](https://www.mozilla.org/en-US/firefox/new/).
20. Install the 1Password Package into Firefox and Chrome.
21. Setup Google Chrome Profile, and organize extensions synced from google.
22. Make Google Chrome the default browser.
23. Setup `4 - 12 OSX Spaces` via `Mission Control`.
24. In `System Preferences` in the `Keyboard` under `Shortcuts` in `Mission Control` desktop switches to use `ctrl + #` for the first 4 spaces.
25. In `Finder` preferences show `Hard Discs` on the desktop.
26. Use `Show View Options` on the desktop set the icon size to `68 x 68` and `Snap to Grid`.
27. Setup the `TMP` directory on the desktop and make sure all browser downloads default to this folder.
28. Install Microsoft [Office for Mac](https://www.microsoft.com/en-us/store/b/office).
29. Setup / Verify Folder Preferences and adjust Safari home pages..
  ![mission-control](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/folder-preferences.png)
  ![safari](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/safari.png)
30. Install Mizage [Divvy](http://mizage.com/divvy/).
31. Install Mizage [Shush](http://mizage.com/shush/).
32. Install Evernote [Skitch](https://evernote.com/products/skitch).
33. Install [Evernote](https://evernote.com/).
34. Install Bare Bones [Textwrangler](https://www.barebones.com/products/textwrangler/).
35. Install [Slack](https://slack.com).
36. Install iMovie, iPhoto, Keynote, Numbers, Pages, GarageBand from the `App Store`.
37. Install Stairways [Keyboard Maestro](https://www.keyboardmaestro.com/main/).
39. Install Binaryage [Total Finder](https://totalfinder.binaryage.com/).
40. Install [iTerm2](https://www.iterm2.com/).
41. Install [Dropbox](https://www.dropbox.com).
42. Install [Caffeine](http://lightheadsw.com/caffeine/).
43. Install the [Harvest](https://www.getharvest.com/) time tracker.
44. Under the `Keyboard` in system preferences remove all shortcuts for `App Shortcuts`, `Accessibility`, `Spotlight`, `Services`, `Keyboard`, in `Mission Control` all but the `..switch desktop` options we setup earlier, and finally `Launchpad and Dock`.
45. Install Panic's [Transmit](https://panic.com/transmit/).
46. Install CocoaTech's [Pathfinder](https://cocoatech.com/).
47. Install Bjango's [Istat Menus](https://bjango.com/mac/istatmenus/).
48. In Finder `View` to `Show Path Bar` which will display the full folder path at the bottom of a finder window.
49. Install Haystack Software's [Arq](https://www.arqbackup.com/download/) backup software, and configure it to hook up to S3.
50. Configure [Fastmail](https://www.fastmail.com) and [Google](https://mail.google.com/mail/) accounts.
51. Send screenshots to the Desktop's `TMP` folder via: `defaults write com.apple.screencapture location /Users/christopherhough/Desktop/TMP` followed by `killall SystemUIServer`.
52. Set the osx calendar to display 14 days in week view via `defaults write com.apple.iCal "n days of week" 14`.
53. Configure Divvy Shortcuts.  
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy1.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy2.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/divvy/divvy3.png)
54. Setup `OSX Messages` for all accounts.
55. Install Omnigroup's [Omnigraffle](https://www.omnigroup.com/omnigraffle).
56. Adjust the applications in the OSX notification center.
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
66. In `System Preferences` under `Notifications` set `do not disturb` from 12:00AM to 11:59PM.
67. Setup the `Today` Panel.  
  ![workstation](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/osx-notifications-panel.png)
68. Setup the `Finder` Panel.  
  ![workstation](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20180414/workstation/osx-finder-panel.png)
