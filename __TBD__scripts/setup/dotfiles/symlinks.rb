require 'fileutils'
require_relative 'settings'
include Settings

# ------------------------------------------------------------------------

# ln -s "$HOME/.myconfigurations" "$HOME/Documents/myconfigurations"


# cd "$HOME/Library/Application Support/Code/User/"
# sudo codesign --force --deep --sign - /Applications/Visual\ Studio\ Code.app
# ln -s ~/.myconfigurations/workstation/vscode/settings.json "$HOME/Library/Application Support/Code/settings.json"
# ln -s ~/.myconfigurations/workstation/vscode/keybindings.json "$HOME/Library/Application Support/Code/keybindings.json"
# ln -s "$HOME/.myconfigurations/workstation/vscode/snippets/ruby.json" "$HOME/Library/Application Support/Code/User/snippets/ruby.json"


# ------------------------------------------------------------------------

def remove_installed_file(filename)pwd
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

# ------------------------------------------------------------------------
