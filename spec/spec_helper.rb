lib_path = File.expand_path(File.join(File.dirname(__FILE__), "..", "lib"))
Dir["#{lib_path}/**/*.rb"].each { |f| require f }

# load support files
Dir[File.dirname(__FILE__) + '/support/**/*.rb'].each { |f| require f }

require 'byebug'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
