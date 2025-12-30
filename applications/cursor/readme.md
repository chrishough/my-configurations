
cd "$HOME/Library/Application Support/Cursor/User/"

sudo codesign --force --deep --sign - /Applications/Cursor.app

xattr -d com.apple.quarantine /Applications/Cursor.app

cursor --list-extensions > "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"

xargs -n1 cursor --install-extension < "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"

cursor --install-extension vscode-theme-railscasts-plus/vscode-theme-railscasts-plus-0.0.6.vsix
cursor --install-extension misogi.ruby-rubocop-0.8.5.vsix
cursor --install-extension vscode-markdown-emoji/markdown-emoji-0.3.1.vsix

cursor --list-extensions \
  | grep -v "marlosirapuan.vscode-theme-railscasts-plus" \
  | grep -v "misogi.ruby-rubocop" \
  | grep -v "bierner.markdown-emoji" \
  > "/Users/christopherhough/Library/Application Support/Cursor/User/extensions.txt"
