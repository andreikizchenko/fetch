require_relative '../client'

module API
  module Endpoint
    class LocationName
      ENDPOINT = 'direct'.freeze
      COUNTRY = 'US'.freeze
      LIMIT = '1'.freeze

      def initialize(city, state)
        q = [city, state, COUNTRY].join(',')
        @params = { q: q, limit: LIMIT }
      end

      def response
        client = API::Client.new(ENDPOINT, @params)
        response = client.request
        JSON.parse(response.body).first
      end
    end
  end
end
