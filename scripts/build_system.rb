require 'fileutils'

@dot_file_list = ['.pryrc','.vimrc','.zprofile','.zshrc','.profile','.gemrc','.bashrc','.bash_profile']
@home_dir = Dir.home
@backup_dir = File.join(@home_dir,'.myconfigurations-backups')
@working_dir = File.join(@home_dir,'.myconfigurations','workstation','dotfiles')

# Set it up!

def build_file_vars(filename)
  @curr_dot_file = File.join(@home_dir,filename)
  @new_dot_file = File.join(@working_dir,filename)
end

def backup_dot_file(filename)
  begin
    FileUtils.cp(@curr_dot_file,@backup_dir)
    puts "#{filename} has been successfully backed up..."
  rescue
    puts "Error! '#{filename}' can not be found! SKIPPED..."
  end
end

def create_dot_file_shortcut(filename)
  begin
    FileUtils.rm(@curr_dot_file)
    puts "#{filename} has been successfully removed..."
    FileUtils.ln_s(@new_dot_file, @curr_dot_file, force: true)
    puts "#{filename} shortcut has been created successfully..."
  rescue
    puts "Error! '#{filename}' back shortcut can not be created! SKIPPED..."
  end
end

def build_backup_dir
  unless File.directory?(@backup_dir)
    puts 'Create back up directory...'
    FileUtils.mkdir_p(@backup_dir)
  end
end

# Run it!

build_backup_dir()
@dot_file_list.each { |filename|
  build_file_vars(filename)
  backup_dot_file(filename)
  create_dot_file_shortcut(filename)
}
