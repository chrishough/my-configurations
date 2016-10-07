require 'fileutils'
require_relative 'settings'
include Settings

def remove_installed_file(filename)
  FileUtils.rm(@curr_dot_file)
  puts "#{filename} has been successfully removed..."
end

def create_dot_file_shortcut(filename)
  remove_installed_file(filename) if File.exist?(@curr_dot_file)
  FileUtils.ln_s(@new_dot_file, @curr_dot_file, force: true)
  puts "#{filename} shortcut has been created successfully..."
end

DOT_FILE_LIST.each do |filename|
  build_file_vars(filename)
  create_dot_file_shortcut(filename)
end
