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


# cd "$HOME/Library/Application Support/Windsurf/User/"
# sudo codesign --force --deep --sign - /Applications/Windsurf.app
# xattr -d com.apple.quarantine /Applications/Windsurf.app
# ln -s "$HOME/.myconfigurations/workstation/windsurf/settings.json" "$HOME/Library/Application Support/Windsurf/User/settings.json"
# ln -s "$HOME/.myconfigurations/workstation/windsurf/keybindings.json" "$HOME/Library/Application Support/Windsurf/User/keybindings.json"
# ln -s "$HOME/.myconfigurations/workstation/windsurf/snippets/ruby.json" "$HOME/Library/Application Support/Windsurf/User/snippets/ruby.json"


# cd "$HOME/Library/Application Support/Cursor/User/"
# sudo codesign --force --deep --sign - /Applications/Cursor.app
# xattr -d com.apple.quarantine /Applications/Cursor.app
# cursor --list-extensions > "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"
# xargs -n1 cursor --install-extension < "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"

# cursor --install-extension vscode-theme-railscasts-plus/vscode-theme-railscasts-plus-0.0.6.vsix
# cursor --install-extension misogi.ruby-rubocop-0.8.5.vsix
# cursor --install-extension vscode-markdown-emoji/markdown-emoji-0.3.1.vsix


# cursor --list-extensions \
#   | grep -v "marlosirapuan.vscode-theme-railscasts-plus" \
#   | grep -v "misogi.ruby-rubocop" \
#   | grep -v "bierner.markdown-emoji" \
#   > "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"


# ln -s "$HOME/.myconfigurations/workstation/cursor/settings.json" "$HOME/Library/Application Support/Cursor/User/settings.json"
# ln -s "$HOME/.myconfigurations/workstation/cursor/keybindings.json" "$HOME/Library/Application Support/Cursor/User/keybindings.json"
# ln -s "$HOME/.myconfigurations/workstation/cursor/snippets/ruby.json" "$HOME/Library/Application Support/Cursor/User/snippets/ruby.json"
# ln -s "$HOME/.myconfigurations/workstation/cursor/extensions.txt" "$HOME/Library/Application Support/Cursor/User/extensions.txt"


# cd "$HOME/.claude"
# ln -s "$HOME/.myconfigurations/workstation/claude/settings.json" "$HOME/.claude/settings.json"
# ln -s "$HOME/.myconfigurations/workstation/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

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
