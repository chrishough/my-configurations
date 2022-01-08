## <img src="https://raw.githubusercontent.com/chrishough/my-configurations/master/graphics/documentation/readmes/installation.svg" height="20"> Setup a New or Reformatting an Existing Apple Workstation : Step One

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
30. In `Finder` preferences setup `Sidebar`...
    * Disable `Recents`.
    * Disable `Airdrop`.
    * Disable `CDs, DVDs..`.
    * Disable `Bonjour Computers`.
    * Disable `Tags`.
    * Enable `The Computer Name`.
    * Enable `Hard Discs`.
    * Enable `Cloud Storage`.
    * Enable `External Discs`.
31. In `Finder` preferences setup `Advanced`...
    * Under `Keep folders on top` enable `In Windows when sorting by name`.
    * Under `When performing a search` set to `Search This Mac`. 
32. Install [1Password](https://1password.com/) via the `App Store` and sync via personal cloud repo, not icloud.
33. Setup icloud mail accounts that are synced across all Apple Devices.