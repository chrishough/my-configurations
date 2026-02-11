# frozen_string_literal: true

# Add the project's lib directory to the load path so we can require helpers directly.
$LOAD_PATH.unshift File.expand_path( "../lib", __dir__ )

RSpec.configure do |config|
  # Use expect syntax exclusively (no `should`).
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Prevent monkey-patching of objects with `should`.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Run specs in random order to surface order-dependent bugs.
  config.order = :random
  Kernel.srand config.seed
end
