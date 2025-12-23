#!/usr/bin/env ruby
# ruby "$HOME/.myconfigurations/lib/setup.rb"

require_relative 'helpers/setup_helper'

# Initialize PATHS array
PATHS = []

# Load all setup files - they will append to PATHS
require_relative '../aitooling/setup'
require_relative '../dotfiles/setup'
require_relative '../applications/setup'

# Process all collected paths
SetupHelper.process_paths(PATHS)
