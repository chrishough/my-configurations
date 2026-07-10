# frozen_string_literal: true

require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new( :spec )
RuboCop::RakeTask.new( :lint )

desc "Run the full test suite (lint + specs)"
task test: %i[lint spec]

task default: :test
