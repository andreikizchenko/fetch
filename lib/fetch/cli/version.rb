require_relative '../version'

module Fetch
  module CLI
    module Commands
      class Version < Dry::CLI::Command
        desc "Returns current version of the app"

        def call
          puts Fetch::VERSION
        end
      end
    end
  end
end
