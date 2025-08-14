#!/usr/bin/env ruby
# ruby "$HOME/.myconfigurations/lib/setup.rb"

require 'pry'
require_relative 'helpers/setup_helper'

# Collect paths from all setup files
all_paths = []

require_relative '../aitooling/setup'

all_paths.concat(PATHS) if defined?(PATHS)

# Process all collected paths
SetupHelper.process_paths(all_paths)
