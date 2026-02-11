# frozen_string_literal: true

PATHS.push(
  {
    tmux: [
      {
        source: "$HOME/.tmux.conf",
        destination: "$HOME/.myconfigurations/applications/tmux/conf",
      }
    ],
    claude: [
      {
        source: "$HOME/.claude/settings.json",
        destination: "$HOME/.myconfigurations.private/claude/global/settings.json",
      },
      {
        source: "$HOME/.claude/CLAUDE.md",
        destination: "$HOME/.myconfigurations.private/claude/brains/global/CLAUDE.md",
      }
    ],
    vscode: [
      {
        source: "$HOME/Library/Application Support/Code/User/settings.json",
        destination: "$HOME/.myconfigurations/applications/vscode/settings.json",
      },
      {
        source: "$HOME/Library/Application Support/Code/User/keybindings.json",
        destination: "$HOME/.myconfigurations/applications/vscode/keybindings.json",
      },
      {
        source: "$HOME/Library/Application Support/Code/User/snippets/ruby.json",
        destination: "$HOME/.myconfigurations/applications/vscode/snippets/ruby.json",
      }
    ],
  },
)
