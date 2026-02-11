#!/usr/bin/env ruby
# frozen_string_literal: true

# ruby "$HOME/.myconfigurations/lib/setup.rb"

require_relative "helpers/setup_helper"

# Initialize PATHS array
PATHS = [].freeze

require_relative "../applications/setup"
# Load all setup files - they will append to PATHS
require_relative "../dotfiles/setup"

# Process all collected paths
SetupHelper.process_paths( PATHS )
