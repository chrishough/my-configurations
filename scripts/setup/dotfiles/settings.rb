module Settings
  DOT_FILE_LIST = ['.pryrc', '.vimrc', '.zprofile', '.zshrc', '.profile', '.gemrc', '.bashrc', '.bash_profile']
  HOME_DIR = Dir.home
  BACKUP_DIR = File.join(HOME_DIR, '.myconfigurations.original')
  WORKING_DIR = File.join(HOME_DIR, '.myconfigurations', 'dotfiles')

  def build_file_vars(filename)
    @curr_dot_file = File.join(HOME_DIR, filename)
    @new_dot_file = File.join(WORKING_DIR, filename)
  end
end
