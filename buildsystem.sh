cd $HOME
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
while true; do
    read -p "Are you ready to begin? [Yes] or [No]:" yn
    case $yn in
        [Yy]* )
          # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          # START: CORE SETTINGS
          # ---------------------------------------------------------------
          echo "\n"
          # build back up directory
          if [ ! -d .myconfigurations-backups ]; then
            mkdir $HOME/.myconfigurations-backups
          else
            echo "skipped: $HOME/.myconfigurations-backups already configured!"
          fi
          # ---------------------------------------------------------------
          # ZPROFILE
          if [ ! -L .zprofile ]; then
            cp .zprofile $HOME/.myconfigurations-backups/.zprofile
            rm .zprofile
            ln -s $HOME/.myconfigurations/system/.zprofile .zprofile
          else
             echo "skipped: .zprofile already configured!"
          fi
          # ---------------------------------------------------------------
          # ZSHRC
          if [ ! -L .zshrc ]; then
            cp .zshrc $HOME/.myconfigurations-backups/.zshrc
            rm .zshrc
            ln -s $HOME/.myconfigurations/system/.zshrc .zshrc
          else
            echo "skipped: .zshrc already configured!"
          fi
          # ---------------------------------------------------------------
          # GEMRC
          if [ ! -L .gemrc ]; then
            cp .gemrc $HOME/.myconfigurations-backups/.gemrc
            rm .gemrc
            ln -s $HOME/.myconfigurations/system/.gemrc .gemrc
          else
             echo "skipped: .gemrc backup exits!"
          fi
          # ---------------------------------------------------------------
          # GITCONFIG
          if [ ! -L .gitconfig ]; then
            cp .gitconfig $HOME/.myconfigurations-backups/.gitconfig
            rm .gitconfig
            ln -s $HOME/.myconfigurations/system/.gitconfig .gitconfig
          else
             echo "skipped: .gitconfig backup exits!"
          fi
          # ---------------------------------------------------------------
          # BASH_PROFILE
          if [ ! -L .bash_profile ]; then
            cp .bash_profile $HOME/.myconfigurations-backups/.bash_profile
            rm .bash_profile
            ln -s $HOME/.myconfigurations/system/.bash_profile .bash_profile
          else
             echo "skipped: .bash_profile backup exits!"
          fi
          # ---------------------------------------------------------------
          # BASHRC
          if [ ! -L .bashrc ]; then
            cp .bashrc $HOME/.myconfigurations-backups/.bashrc
            rm .bashrc
            ln -s $HOME/.myconfigurations/system/.bashrc .bashrc
          else
             echo "skipped: .bashrc backup exits!"
          fi
          # ---------------------------------------------------------------
          # VIMRC
          if [ ! -L .vimrc ]; then
            cp .vimrc $HOME/.myconfigurations-backups/.vimrc
            rm .vimrc
            ln -s $HOME/.myconfigurations/system/.vimrc .vimrc
          else
             echo "skipped: .vimrc backup exits!"
          fi
          # ---------------------------------------------------------------
          # PROFILE
          if [ ! -L .profile ]; then
            cp .profile $HOME/.myconfigurations-backups/.profile
            rm .profile
            ln -s $HOME/.myconfigurations/system/.profile .profile
          else
             echo "skipped: .profile backup exits!"
          fi
          # ---------------------------------------------------------------
          # END: CORE SETTINGS
          # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          # START: SUBLIME SETTINGS
          # ---------------------------------------------------------------
          # PREFERENCES.SUBLIME-SETTINGS
          cd $HOME/library/Application\ Support/Sublime\ Text\ 3/Packages/user
          if [ ! -L Preferences.sublime-settings ]; then
            cp Preferences.sublime-settings $HOME/.myconfigurations-backups/Preferences.sublime-settings
            rm Preferences.sublime-settings
            ln -s $HOME/.myconfigurations/sublime/Preferences.sublime-settings Preferences.sublime-settings
          else
             echo "skipped: Preferences.sublime-settings backup exits!"
          fi
          # ---------------------------------------------------------------
          # DEFAULT (OSX).SUBLIME-KEYMAP
          if [ ! -L Default\ \(OSX\).sublime-keymap ]; then
            cp Default\ \(OSX\).sublime-keymap $HOME/.myconfigurations-backups/Default\ \(OSX\).sublime-keymap
            rm Default\ \(OSX\).sublime-keymap
            ln -s $HOME/.myconfigurations/sublime/Default\ \(OSX\).sublime-keymap Default\ \(OSX\).sublime-keymap
          else
             echo "skipped: Default (OSX).sublime-keymap Default backup exits!"
          fi
          # ---------------------------------------------------------------
          # BASE16-RAILSCASTS.DARK.CH.TMTHEME
          cd $HOME/library/Application\ Support/Sublime\ Text\ 3/Packages
          cp base16-railscasts.dark.ch.tmTheme $HOME/.myconfigurations-backups/base16-railscasts.dark.ch.tmTheme
          # ---------------------------------------------------------------
          echo "\n"
          break;;
        # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
        [Nn]* ) 
          echo "\nNo Problem! Let's meet up again soon. \n"
          exit;;
        * ) echo "\nPlease answer Yes or No.\n";;
    esac
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
done