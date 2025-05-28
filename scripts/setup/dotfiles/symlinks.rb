require 'fileutils'
require_relative 'settings'
include Settings

# ------------------------------------------------------------------------

# ln -s "$HOME/.myconfigurations" "$HOME/Documents/myconfigurations"

# sudo codesign --force --deep --sign - /Applications/Visual\ Studio\ Code.app
# ln -s ~/.myconfigurations/workstation/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
# ln -s ~/.myconfigurations/workstation/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# sudo codesign --force --deep --sign - /Applications/Windsurf.app
# xattr -d com.apple.quarantine /Applications/Windsurf.app
# ln -s "$HOME/.myconfigurations/workstation/windsurf/settings.json" "$HOME/Library/Application Support/Windsurf/User/settings.json"
# ln -s "$HOME/.myconfigurations/workstation/windsurf/keybindings.json" "$HOME/Library/Application Support/Windsurf/User/keybindings.json"
# ln -s "$HOME/.myconfigurations/workstation/windsurf/snippets/ruby.json" "$HOME/Library/Application Support/Windsurf/User/snippets/ruby.json"

# sudo codesign --force --deep --sign - /Applications/Cursor.app
# ln -s "$HOME/.myconfigurations/workstation/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
# ln -s "$HOME/.myconfigurations/workstation/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"
# ln -s "$HOME/.myconfigurations/workstation/cursor/snippets/ruby.json" "$HOME/Library/Application Support/Cursor/User/snippets/ruby.json"

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
