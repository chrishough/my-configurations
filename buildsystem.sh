cd $home
# START
# ---------------------------------------------------------------
# build back up directory
if [ ! -d .myconfigurations-backups ]; then
  mkdir .myconfigurations-backups
else
  echo "skipped: .myconfigurations-backups already configured!"
fi
# ---------------------------------------------------------------
# ZPROFILE
if [ ! -L .zprofile ]; then
  cp .zprofile .myconfigurations-backups/.zprofile
  rm .zprofile
  ln -s .myconfigurations/system/.zprofile .zprofile
else
   echo "skipped: .zprofile already configured!"
fi
# ---------------------------------------------------------------
# ZSHRC
if [ ! -L .zshrc ]; then
  cp .zshrc .myconfigurations-backups/.zshrc
  rm .zshrc
  ln -s .myconfigurations/system/.zshrc .zshrc
else
  echo "skipped: .zshrc already configured!"
fi
# ---------------------------------------------------------------
if [ ! -L .gemrc ]; then
  cp .gemrc .myconfigurations-backups/.gemrc
  rm .gemrc
  ln -s .myconfigurations/system/.gemrc .gemrc
else
   echo "skipped: .gemrc backup exits!"
fi
# ---------------------------------------------------------------
if [ ! -L .gitconfig ]; then
  cp .gitconfig .myconfigurations-backups/.gitconfig
  rm .gitconfig
  ln -s .myconfigurations/system/.gitconfig .gitconfig
else
   echo "skipped: .gitconfig backup exits!"
fi
# ---------------------------------------------------------------
if [ ! -L .bash_profile ]; then
  cp .bash_profile .myconfigurations-backups/.bash_profile
  rm .bash_profile
  ln -s .myconfigurations/system/.bash_profile .bash_profile
else
   echo "skipped: .bash_profile backup exits!"
fi
# ---------------------------------------------------------------
if [ ! -L .bashrc ]; then
  cp .bashrc .myconfigurations-backups/.bashrc
  rm .bashrc
  ln -s .myconfigurations/system/.bashrc .bashrc
else
   echo "skipped: .bashrc backup exits!"
fi
# ---------------------------------------------------------------
if [ ! -L .vimrc ]; then
  cp .vimrc .myconfigurations-backups/.vimrc
  rm .vimrc
  ln -s .myconfigurations/system/.vimrc .vimrc
else
   echo "skipped: .vimrc backup exits!"
fi
# ---------------------------------------------------------------
if [ ! -L .profile ]; then
  cp .profile .myconfigurations-backups/.profile
  rm .profile
  ln -s .myconfigurations/system/.profile .profile
else
   echo "skipped: .profile backup exits!"
fi
# ---------------------------------------------------------------
# END


