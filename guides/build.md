## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/installation.svg" height="20"> Setup a New or Reformatting an Existing Apple Workstation

> If you need to reinstall the operating system follow "[How to install macOS](https://support.apple.com/en-us/HT204904)" from the Apple Support documentation.

### This Guide was written on OSX 12 "Monterey"

1. Following this [guide from Apple](https://support.apple.com/en-us/HT204904) reboot into the system utilities and completely wipe the hard drive and reinstall the operating system. This guide use this step: `On an Intel-based Mac, if you use Shift-Option-Command-R during startup, you're offered the macOS that came with your Mac, or the closest version still available. If you use Option-Command-R during startup, in most cases you're offered the latest macOS that is compatible with your Mac. Otherwise you're offered the macOS that came with your Mac, or the closest version still available.` 
2. When the format utility for erasing the hard drive prompts for name for the drive, I name it `MACHD` during the reformat process, and the format is `APFS`. Please note, I turn on filevault after the full reformat to keep the drive key synced with iCloud, and SSD type drives do not have the option to zero out like older drives.
3. Once the drive is reformatted, reinstall macOS using your home network, and iCloud account. I also allow my Apple ID to reset my workstation password.
4. Under `Customize Settings` I `Enable Location Services` and do not share `Mac Analytics`, `Crash Data`, `Ask Siri`, and I uncheck `Store files from Documents and Desktop in iCloud Drive`. 
5. Under `Customize Settings` I make sure to turn on `FileVault disk encryption` and `Allow my iCloud account to unlock my disk`.
6. Open the disc utility and if you notice an internal volume named `Update` delete it via this [guide from Apple](https://support.apple.com/guide/disk-utility/add-erase-or-delete-apfs-volumes-dskua9e6a110/mac), then restart the computer. Please note, this may also cause a warning `Incompatible Disc` to be displayed. If this occurs, you will need repeat steps 1 through 5 following [this video walkthrough](https://youtu.be/HFo9mTfTk9I). Once these steps have been completed you should be successfully connected to your wifi.
7. Under the `App Store` in System Preferences, make sure `Automatically Check for Updates` is checked, and `Download new available updates in the background` and `Install system data files and security updates` are both checked. 
8. Click `Show Updates` and run all pending updates.
9. Install the full `Xcode` developer package from the Apple App Store. I use the full package because it comes with both the gcc compiler and emulators for iOS devices. These come in handy for testing responsive websites and applications. Please note, this will require the latest version of the osx operating system, and if `FileVault` has not finished encrypting the hard drive you will have to wait for that to finish. The status can be located under `Settings and Privacy` then under `FileVault`.
10. Open `Xcode` and verify it both installs the required components it needs and launches without errors.
11. Open `Terminal` and install the developer tools by typing `xcode-select --install`.
12. Under `System Preferences` under `Users & Groups` disable the `Guest User` from being able to access the computer, then reboot the machine to confirm.
13. In `System Preferences` under the `Trackpad` disable `Natural` scrolling.
14. In `System Preferences` under the `Trackpad` under `Point and Click` set the tracking speed to `6`.
15. In `Accessibility` under `Display` set the cursor size to `2`.
16. In `Accessibility` under `Captions` set to `Large Text`.
17. Remove `Siri`, `Display Mirroring`, and `Spotlight` from the top navigation bar.
18. In `System Preferences` under `Displays` set `Resolution` to `scaled` and select `more space`. 
19. In `System Preferences` under the `Keyboard` settings make sure to check `Use the F1, F2, as standard function keys`.
20. In `System Preferences` under the `Energy Saver` set display to turn off after 30 minutes, and uncheck `Put hard disks to sleep when possible` and `Prevent computer from sleeping automatically when display is off`.
21. Under `System Preferences` under `Mission Control` configure `Hot Corners`.
    * Top-Left: Application Windows
    * Bottom-Left: Desktop
    * Top-Right: Mission Control
    * Bottom-Right: Start Screen Saver
22. Under `System Preferences` configure `Mission Control`.
    * Disable `Automatically Rearrange Spaces...`.
    * Set `Mission Control` to `F3`.
    * Set `Application Windows` to `F4`.
    * Set both `Show Desktop` and `Show Dashboard` to `-`.
23. In `System Preferences` configure the `Dock & Menu Bar`.
    * Enable `Magnification` and set it to `max`.
    * Enable `Automatically hide and show the Dock`.
24. Remove every application icon from the dock except finder on the bottom left, and the trash can on the bottom right.
25. Setup at least `4 OSX Spaces` via `Mission Control`.
26. In `System Preferences` in the `Keyboard` under `Shortcuts` in `Mission Control` desktop switches to use `ctrl + #` for the first 4 spaces.
27. In `Finder` preferences only show `Hard Discs` and `External Discs` on the desktop, and set new finder windows to open with `user home directory`. 
28. In Finder `View` to `Show Path Bar`, `Show Status Bar`,  which will display the full folder path at the bottom of a finder window.
29. Use `Show View Options` on the desktop set the icon size to `68 x 68` then right click on the desktop and set the `Sort By` to `Snap to Grid`. 
30. In `Finder` preferences setup the `Sidebar`...
    * ![folder-prefrences](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/workstation/folder-preferences-2.png)  
31. In `Finder` preferences setup the `Advanced`...
    * ![folder-prefrences](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/workstation/folder-preferences-3.png)

***
***
***

https://plugins.jetbrains.com/plugin/10080-rainbow-brackets  
https://plugins.jetbrains.com/plugin/13308-indent-rainbow  
https://plugins.jetbrains.com/plugin/7495--ignore   
https://plugins.jetbrains.com/plugin/7499-gittoolbox   
https://plugins.jetbrains.com/plugin/8575-nyan-progress-bar   
https://plugins.jetbrains.com/plugin/12062-vscode-keymap   
https://plugins.jetbrains.com/plugin/10044-atom-material-icons  
https://plugins.jetbrains.com/plugin/12310-gruvbox-theme  



4. Install [1Password](https://1password.com/) and sync via personal cloud repo, not icloud.

6. Setup icloud mail accounts that are synced across all Apple Devices.





16. Install [AlfredApp](https://www.alfredapp.com/).
17. Set the Alfred launch shortcut to `cmd + spacebar`.
18. In `System Preferences` in the `Keyboard` under `Shortcuts` disable all Spotlight keyboard shortcuts.






30. Setup Finder Folder Preferences.   


31. Download and Install [Chrome](https://www.google.com/chrome/browser/desktop/index.html), [Firefox](https://www.mozilla.org/en-US/firefox/new/), and [Brave](https://github.com/chrishough/my-configurations).
32. Install the 1Password Package into all browsers.
33. Setup Google Chrome Profile, and organize extensions synced from google.
34. Make Google Chrome the default browser.
35. Setup the `TMP` directory on the desktop and make sure all browser downloads default to this folder.
36. Install iMovie, iPhoto, Keynote, Numbers, Pages, GarageBand, FaceTime from the `App Store`.
37. Install [Shush](http://mizage.com/shush/) from the `App Store`. Open after to configure. 
  ![shush](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/shush/shush-1.png)
38. Install [Evernote](https://evernote.com/) from the `App Store`. Open after to configure.
39. Install Skitch [Skitch](https://evernote.com/products/skitch) from the `App Store`. Open after to configure.
40. Install [Paprika](https://www.paprikaapp.com/) from the `App Store`. Open after to configure.
41. Install [Harvest](https://www.getharvest.com/) from the `App Store`. Open after to configure.
42. Install [Ommwriter](https://ommwriter.com/) from the `App Store`. Open after to configure.
43. Install [Slack](https://slack.com) from the `App Store`. Open after to configure.
44. Install [Office for Mac](https://www.microsoft.com/en-us/store/b/office).
45. Install [Divvy](http://mizage.com/divvy/), and set to open via `cmd + shift + space`.
46. Configure Divvy Shortcuts.  
  ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy1.png)
  ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy2.png)
  ![divvy](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/divvy/divvy3.png)
47. Install [Keyboard Maestro](https://www.keyboardmaestro.com/main/).
48. Install [Total Finder](https://totalfinder.binaryage.com/).
49. Install [iTerm2](https://www.iterm2.com/).
50. Install [Dropbox](https://www.dropbox.com).
51. Install [Caffeine](http://lightheadsw.com/caffeine/). 
  ![caffeine](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/caffeine/caffeine-1.png)
52. Install [Transmit](https://panic.com/transmit/).
53. Install [Pathfinder](https://cocoatech.com/).
54. Install [Istat Menus](https://bjango.com/mac/istatmenus/).
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-1.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-2.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-3.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-4.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-5.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-6.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-7.png)
    ![istat-menus](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/istatmenus/istatmenus-8.png)
55. Install [Omnigraffle](https://www.omnigroup.com/omnigraffle).
56. Install [Bartender](https://www.macbartender.com/).  
  ![bartender](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/bartender/bartender-1.png)  
  ![bartender](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/bartender/bartender-2.png)  
57. Send screenshots to the Desktop's `TMP` folder via: `defaults write com.apple.screencapture location /Users/christopherhough/Desktop/TMP` followed by `killall SystemUIServer`.
58. Set the osx calendar to display 14 days in week view via `defaults write com.apple.iCal "n days of week" 14`.
59. Setup `OSX Messages` for all accounts. Verify non-apple users too.
60. In `System Preferences` under `Notifications` set `do not disturb` from 12:00AM to 11:59PM.
61. Setup the `Today` Panel.
  ![workstation](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/workstation/osx-notifications-panel.png)
62. Install Haystack Software's [Arq](https://www.arqbackup.com/download/) backup software, and configure it to hook up to S3.  

> If this is a migration of an existing computer, now is the time to bring over each folder and back them up to a new S3 bucket with a new IAM user, and new bucket policy. Once all of the files have been updated, reformat the old machine and sell it. Use a tough eraser i.e. `diskutil secureErase freespace 3 /Volumes/DRIVE` via https://www.backblaze.com/blog/how-to-wipe-a-mac-hard-drive/   

  ![arq](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/arq/arq-1.png)
63. Setup the `Finder` Panel.  
  ![workstation](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/workstation/finder-panel.png)    
64. Install [Amazon Music](https://www.amazon.com/gp/help/customer/display.html?nodeId=201377740).    
65. Install [Jing](https://www.techsmith.com/jing-tool.html).     
66. Follow the [Engineering Work Setup and Configuration](/guides/workstation.md) guide.  
67. Follow the [Ruby Engineering Configuration](/guides/ruby.md) guide.  
68. Follow the [JavaScript Engineering Configuration](/guides/js.md) guide.  
69. Follow the [Shell Configuration](/guides/shell.md) guide.  
70. Setup Alfred theme and workflows brought in from the `.myconfigurations` repo.  
  ![alfred](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/alfred/alfred1.png)  
  ![alfred](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/alfred/alfred2.png)  
  ![alfred](https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/guides/alfred/alfred3.png)  
71. Follow the [IDE Configuration](/guides/ide.md) guide.  
72. Follow the [Database Configuration](/guides/database.md) guid
