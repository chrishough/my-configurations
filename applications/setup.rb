PATHS ||= []
PATHS.concat([
  {
    tmux: [
      {
        source: "$HOME/.tmux.conf",
        destination: "$HOME/.myconfigurations/applications/tmux/conf"
      }
    ],
    vscode: [
      {
        source: "$HOME/Library/Application Support/Code/User/settings.json",
        destination: "$HOME/.myconfigurations/applications/vscode/settings.json"
      },
      {
        source: "$HOME/Library/Application Support/Code/User/keybindings.json",
        destination: "$HOME/.myconfigurations/applications/vscode/keybindings.json"
      },
      {
        source: "$HOME/Library/Application Support/Code/User/snippets/ruby.json",
        destination: "$HOME/.myconfigurations/applications/vscode/snippets/ruby.json"
      }
    ]
  }
])









