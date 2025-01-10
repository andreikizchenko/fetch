# require "bundler/setup"
require "dry/cli"
require_relative 'fetch/cli/locations'
require_relative 'fetch/cli/version'

module Fetch
  module CLI
    module Commands
      extend Dry::CLI::Registry

      register 'locations', Locations, aliases: %w[l -l --locations]
      register 'version', Version, aliases: %w[v -v --version]
    end
  end
end