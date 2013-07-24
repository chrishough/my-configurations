cd $home
# build back up directory
if [ ! -d .myconfigurations-backups ]; then
  mkdir .myconfigurations-backups
else
  echo "skipped: .myconfigurations-backups exits!"
fi
# backup core configuration
if [ ! -L .bash_profile ]; then
  cp .bash_profile .myconfigurations-backups/.bash_profile
else
   echo "skipped: .bash_profile backup exits!"
fi
if [ ! -L .bashrc ]; then
  cp .bashrc .myconfigurations-backups/.bashrc
else
   echo "skipped: .bashrc backup exits!"
fi
if [ ! -L .gemrc ]; then
  cp .gemrc .myconfigurations-backups/.gemrc
else
   echo "skipped: .zshrc backup exits!"
fi
if [ ! -L .gitconfig ]; then
  cp .gitconfig .myconfigurations-backups/.gitconfig
else
   echo "skipped: .gitconfig backup exits!"
fi
if [ ! -L .vimrc ]; then
  cp .vimrc .myconfigurations-backups/.vimrc
else
   echo "skipped: .vimrc backup exits!"
fi
if [ ! -L .zprofile ]; then
  cp .zprofile .myconfigurations-backups/.zprofile
else
   echo "skipped: .zprofile backup exits & symlink created!"
fi
if [ ! -L .zshrc ]; then
  cp .zshrc .myconfigurations-backups/.zshrc
else
  echo "skipped: .zshrc backup exits!"
fi
# process all re-maps
rm .zprofile
ln -s .myconfigurations/system/.zprofile .zprofile