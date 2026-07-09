# frozen_string_literal: true

PATHS.push(
  {
    tmux: [
      {
        source: "$HOME/.tmux.conf",
        destination: "$HOME/.myconfigurations/applications/tmux/conf",
      },
      {
        source: "$HOME/.myconfigurations/applications/tmux/paths.json",
        destination: "#{ENV['MYCONFIGURATIONS_PRIVATE_PATH']}/tmux/paths.json",
      }
    ],
    claude: [
      {
        source: "$HOME/.claude/settings.json",
        destination: "#{ENV['MYCONFIGURATIONS_PRIVATE_PATH']}/claude/global/settings.json",
      },
      {
        source: "$HOME/.claude/CLAUDE.md",
        destination: "#{ENV['MYCONFIGURATIONS_PRIVATE_PATH']}/claude/brains/global/CLAUDE.md",
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
