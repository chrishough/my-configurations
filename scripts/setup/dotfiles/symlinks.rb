require 'fileutils'
require_relative 'settings'
include Settings

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

DOT_FILE_LIST.each do |filename|
  build_file_vars(filename)
  create_dot_file_shortcut(filename)
end
