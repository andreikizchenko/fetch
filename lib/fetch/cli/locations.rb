require_relative '../../utils/location_helper'

module Fetch
  module CLI
    module Commands
      class Locations < Dry::CLI::Command
        desc "Returns location info for multiple locations in the US"

        argument :locations, type: :array, required: true, desc: "List of names and/or zip codes of locations"

        def call(locations:, **)
          locations.each { |location| puts LocationHelper.new(location).data }
        end
      end
    end
  end
end
