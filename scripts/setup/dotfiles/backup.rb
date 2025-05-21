require 'fileutils'
require_relative 'settings'
include Settings

def backup_dot_file(filename)
  begin
    FileUtils.cp(@curr_dot_file, BACKUP_DIR)
    puts "#{filename} has been successfully backed up..."
  rescue
    puts "Error! '#{filename}' can not be found! SKIPPED..."
  end
end

def build_backup_dir
  unless File.directory?(BACKUP_DIR)
    puts 'Create back up directory...'
    FileUtils.mkdir_p(BACKUP_DIR)
  end
end

build_backup_dir

DOT_FILE_LIST.each do |filename|
  build_file_vars(filename)
  backup_dot_file(filename)
end
