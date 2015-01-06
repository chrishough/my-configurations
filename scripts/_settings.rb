@dot_file_list = ['.pryrc','.vimrc','.zprofile','.zshrc','.profile','.gemrc','.bashrc','.bash_profile']
@home_dir = Dir.home
@backup_dir = File.join(@home_dir,'.myconfigurations-backups')
@working_dir = File.join(@home_dir,'.myconfigurations','workstation','dotfiles')

def build_file_vars(filename)
  @curr_dot_file = File.join(@home_dir,filename)
  @new_dot_file = File.join(@working_dir,filename)
end
