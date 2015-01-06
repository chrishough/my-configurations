require 'fileutils'
require_relative 'settings'

def backup_dot_file(filename)
  begin
    FileUtils.cp(@curr_dot_file,@backup_dir)
    puts "#{filename} has been successfully backed up..."
  rescue
    puts "Error! '#{filename}' can not be found! SKIPPED..."
  end
end

def build_backup_dir
  unless File.directory?(@backup_dir)
    puts 'Create back up directory...'
    FileUtils.mkdir_p(@backup_dir)
  end
end

build_backup_dir()

@dot_file_list.each { |filename|
  build_file_vars(filename)
  backup_dot_file(filename)
}
