#!/usr/bin/env ruby
# ruby "$HOME/.myconfigurations/applications/claude/setup.rb"

require_relative 'helpers/setup_helper'

PATHS ||= []
PATHS.concat([
  {
    claude: [
      {
        source: ".claude/settings.local.json",
        destination: "$HOME/.myconfigurations.ai/claude/local/settings.json"
      }
    ]
  }
])

# Process all collected paths
SetupHelper.process_paths(PATHS)








