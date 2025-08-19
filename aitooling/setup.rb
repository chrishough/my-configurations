PATHS ||= []
PATHS.concat([
  {
    claude: [
      {
        source: "$HOME/.claude/settings.json",
        destination: "$HOME/.myconfigurations/aitooling/claude/settings.json"
      },
      {
        source: "$HOME/.claude/CLAUDE.md",
        destination: "$HOME/.myconfigurations/aitooling/claude/CLAUDE.md"
      }
    ],
    cursor: [
      {
        source: "$HOME/Library/Application Support/Cursor/User/settings.json",
        destination: "$HOME/.myconfigurations/aitooling/cursor/settings.json"
      },
      {
        source: "$HOME/Library/Application Support/Cursor/User/keybindings.json",
        destination: "$HOME/.myconfigurations/aitooling/cursor/keybindings.json"
      },
      {
        source: "$HOME/Library/Application Support/Cursor/User/extensions.txt",
        destination: "$HOME/.myconfigurations/aitooling/cursor/extensions.txt"
      },
      {
        source: "$HOME/Library/Application Support/Cursor/User/snippets/ruby.json",
        destination: "$HOME/.myconfigurations/aitooling/cursor/snippets/ruby.json"
      }
    ]
  }
])









