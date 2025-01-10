require_relative '../client'

module API
  module Endpoint
    class ZipCode
      ENDPOINT = 'zip'.freeze

      def initialize(zip_code)
        @params = { zip: zip_code }
      end

      def info
        client = API::Client.new(ENDPOINT, @params)
        response = client.request
        JSON.parse(response.body)
      end
    end
  end
end
