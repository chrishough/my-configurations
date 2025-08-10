#!/bin/bash

# Check if this is a Ruby project and run rubocop if available

# Check for Ruby project indicators
if [ -f "Gemfile" ] && [ -f ".rubocop.yml" ] && [ -f ".ruby-version" ]; then
  echo "Ruby Project Detected"

  # Check if rubocop is available via bundle exec
  if bundle list 2>/dev/null | grep -q "rubocop"; then
    echo "Running Rubocop..."
    bundle exec rubocop -A
  else
    echo "Rubocop Not Found!"
    exit 0
  fi
fi
