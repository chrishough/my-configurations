## <img src="https://cdn.rawgit.com/chrishough/my-public-data/master/my-configurations/ide.svg" height="20"> IDE Configuration

I have used a variety of editors over the years including homesite, dreamweaver, eclipse, vim, sublime text, sublime text 2, and atom.  My current build utilizes [atom](https://atom.io/) to get the job done, and I have been working with it since beta.  No, it is not as fast as an engineer who has mastered the vim keyboard but it comes pretty darn close.

1. Download and install [atom](https://atom.io/). This will normally be dropped into your downloads directory. Like all Apple OS applications make sure to drag this to the applications directory.
2. Type `cmd + space` to launch `Atom` to approve the EULA. Once approved, close the application.
3. Backup the existing atom configuration.  
`ruby $HOME/.myconfigurations/scripts/setup/ide/backup.rb`
4. Setup symlinks to our atom configuration files.  
`ruby $HOME/.myconfigurations/scripts/setup/ide/symlinks.rb`
5. Setup symlinks to our application configuration files.  
`ruby $HOME/.myconfigurations/scripts/setup/apps/symlinks.rb`
6. From the command prompt type `atom` followed by `cmd + ,` and click on install. On this interface we want to search for [package-sync](https://atom.io/packages/package-sync) and install it.
7. With package-sync installed type `shift + cmd + p` and type `package-sync:sync`. This will install all of the packages inside the `package.cson` file.  Please watch the bottom of atom to see it scrolling through the installation process. Once complete please close atom and re-open it. If you do not have any errors, you are good to go. I enjoy adjusting this configuration and keep an updated copy of my [package list](https://github.com/chrishough/my-configurations/blob/master/workstation/atom/packages.cson).
8. If prompted by Atom to install the latest Java JDX on OSX follow this guide: [How to: Fix Java Command-Line Tool Pop-Up on Mac OS](https://www.theitsage.com/fix-java-command-line-tool-popup-mac/). You will need to download and install [Java for OS X 2015-001](https://support.apple.com/kb/dl1572?locale=en_US).

**My Atom Design**
![atom](https://github.com/chrishough/my-public-data/raw/master/my-configurations/atom-editor-v4.0.0.png)
