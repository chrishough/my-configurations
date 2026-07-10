#!/usr/bin/env ruby
# frozen_string_literal: true

# ruby "$HOME/.myconfigurations/applications/claude/setup.rb"

require "highline"
require_relative "../../lib/helpers/setup_helper"

# Guard: this script must only run inside a git project directory.
# unless system( "git rev-parse --git-dir > /dev/null 2>&1" )
#   cli = HighLine.new
#   cli.say( "<%= color( 'ERROR: Must be run inside a git project directory!', :red ) %>" )
#   exit( 1 )
# end

SetupHelper.ensure_private_path!

PATHS = [] # rubocop:disable Style/MutableConstant
PATHS.push(
  {
    claude: [
      {
        source: ".claude/settings.local.json",
        destination: "#{ENV['MYCONFIGURATIONS_PRIVATE_PATH']}/claude/local/settings.local.json",
      }
    ],
  },
)

# Process all collected paths
SetupHelper.process_paths( PATHS )

