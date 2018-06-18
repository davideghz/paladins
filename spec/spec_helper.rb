require 'bundler/setup'
require 'pry'
require 'paladins'

Paladins.configure do |config|
  config.dev_id = ENV['PALADINS_DEV_ID']
  config.auth_key = ENV['PALADINS_AUTH_KEY']
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
