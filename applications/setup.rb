PATHS ||= []
PATHS.concat([
  {
    itermocil: [
      {
        source: "$HOME/.itermocil",
        destination: "$HOME/.myconfigurations/applications/itermocil"
      }
    ],
    tmux: [
      {
        source: "$HOME/.tmux.conf",
        destination: "$HOME/.myconfigurations/applications/tmux/conf"
      }
    ],
    tmuxinator: [
      {
        source: "$HOME/.tmuxinator",
        destination: "$HOME/.myconfigurations/applications/tmuxinator"
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









