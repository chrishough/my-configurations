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
  ![hot-corners](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/workstation/hot-corners.png)
  ![mission-control](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/workstation/mission-control.png)
17. In the `Keyboard` settings make sure to check `Use the F1, F2, as standard function keys`.
17. In the `Energy Savor` set display to turn off after 30 minutes, and uncheck `Put hard disks to sleep when possible` and `Prevent computer from sleeping automatically when display is off`.
18. Download and Install [Chrome](https://www.google.com/chrome/browser/desktop/index.html) and [Firefox](https://www.mozilla.org/en-US/firefox/new/).
19. Install the 1Password Package into Firefox and Chrome.
20. Setup Google Chrome Profile, and organize extensions synced from google.
21. Make Google Chrome the default browser.
22. Setup `4 - 12 OSX Spaces` via `Mission Control`.
23. In `System Preferences` in the `Keyboard` under `Shortcuts` in `Mission Control` desktop switches to use `ctrl + #` for the first 4 spaces.
24. In `Finder` preferences show `Hard Discs` on the desktop.
25. Use `Show View Options` on the desktop set the icon size to `68 x 68` and `Snap to Grid`.
26. Setup the `TMP` directory on the desktop and make sure all browser downloads default to this folder.
27. Install Microsoft [Office for Mac](https://www.microsoft.com/en-us/store/b/office).
28. Setup / Verify Folder Preferences and adjust Safari home pages..
  ![mission-control](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/workstation/folder-preferences.png)
  ![safari](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/workstation/safari.png)
29. Install Mizage [Divvy](http://mizage.com/divvy/).
30. Install Mizage [Shush](http://mizage.com/shush/).
31. Install Evernote [Skitch](https://evernote.com/products/skitch).
32. Install [Evernote](https://evernote.com/).
33. Install Bare Bones [Textwrangler](https://www.barebones.com/products/textwrangler/).
34. Install [Slack](https://slack.com).
35. Install iMovie, iPhoto, Keynote, Numbers, Pages, GarageBand from the `App Store`.
36. Install Stairways [Keyboard Maestro](https://www.keyboardmaestro.com/main/).
37. Install Binaryage [Total Finder](https://totalfinder.binaryage.com/).
38. Install [iTerm2](https://www.iterm2.com/).
39. Install [Dropbox](https://www.dropbox.com).
40. Install [Caffeine](http://lightheadsw.com/caffeine/).
41. Install the [Harvest](https://www.getharvest.com/) time tracker.
42. Under the `Keyboard` in system preferences remove all shortcuts for `App Shortcuts`, `Accessibility`, `Spotlight`, `Services`, `Keyboard`, in `Mission Control` all but the `..switch desktop` options we setup earlier, and finally `Launchpad and Dock`.
43. Install Panic's [Transmit](https://panic.com/transmit/).
44. Install CocoaTech's [Pathfinder](https://cocoatech.com/).
45. Install Bjango's [Istat Menus](https://bjango.com/mac/istatmenus/).
46. In Finder `View` to `Show Path Bar` which will display the full folder path at the bottom of a finder window.
47. Install Haystack Software's [Arq](https://www.arqbackup.com/download/) backup software, and configure it to hook up to S3.
48. Configure [Fastmail](https://www.fastmail.com) and [Google](https://mail.google.com/mail/) accounts.
49. Send screenshots to the Desktop's `TMP` folder via: `defaults write com.apple.screencapture location /Users/christopherhough/Desktop/TMP` followed by `killall SystemUIServer`.
50. Set the osx calendar to display 14 days in week view via `defaults write com.apple.iCal "n days of week" 14`.
51. Configure Divvy Shortcuts.  
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/divvy/divvy1.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/divvy/divvy2.png)
  ![divvy](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/divvy/divvy3.png)
52. Setup `OSX Messages` for all accounts.
53. Install Omnigroup's [Omnigraffle](https://www.omnigroup.com/omnigraffle).
54. Adjust the applications in the OSX notification center.
55. Follow the [Engineering Work Setup and Configuration](/guides/workstation.md) guide.
56. Follow the [Ruby Engineering Configuration](/guides/ruby.md) guide.
57. Follow the [JavaScript Engineering Configuration](/guides/js.md) guide.
58. Follow the [Shell Configuration](/guides/shell.md) guide.
59. Setup Alfred theme and workflows brought in from the `.myconfigurations` repo.
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/alfred/alfred1.png)
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/alfred/alfred2.png)
  ![alfred](https://github.com/chrishough/my-public-data/raw/master/my-configurations/20171001/alfred/alfred3.png)
60. Follow the [IDE Configuration](/guides/ide.md) guide.
61. Follow the [Database Configuration](/guides/database.md) guide.
62. Install Kapeli's [Dash Docs](https://kapeli.com/dash).
63. Install the [Heroku CLI Tool](https://devcenter.heroku.com/articles/heroku-cli) via `brew install heroku/brew/heroku`.
64. Install [NGROK](https://ngrok.com/) via this [guide](https://gist.github.com/wosephjeber/aa174fb851dfe87e644e).
