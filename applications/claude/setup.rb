#!/usr/bin/env ruby
# frozen_string_literal: true

# ruby "$HOME/.myconfigurations/applications/claude/setup.rb"

require_relative "helpers/setup_helper"

PATHS = [] # rubocop:disable Style/MutableConstant
PATHS.push(
  {
    claude: [
      {
        source: "test/.claude/settings.local.json",
        destination: "$HOME/.myconfigurations.private/claude/local/settings.json",
      }
    ],
  },
)

# Process all collected paths
SetupHelper.process_paths( PATHS )
