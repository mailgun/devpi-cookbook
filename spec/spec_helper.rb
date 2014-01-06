# Pull in commonly used libraries.
require 'chefspec'
require 'chefspec/berkshelf'
require 'support/matchers.rb'

# Configure SafeYAML so that it doesn't complain so much.
require 'safe_yaml'

# This option prevents SafeYAML from complaining in `load`.
SafeYAML::OPTIONS[:default_mode] = :safe

# This is a workaround to https://github.com/dtao/safe_yaml/issues/10
SafeYAML::OPTIONS[:deserialize_symbols] = true
