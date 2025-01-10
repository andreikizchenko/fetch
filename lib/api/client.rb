require 'net/http'
require 'uri'
require 'json'

module API
  class Client
    BASE_URL = 'http://api.openweathermap.org/geo/1.0/'.freeze
    API_KEY = 'f897a99d971b5eef57be6fafa0d83239'.freeze

    def initialize(endpoint, params = {})
      params.update(appid: API_KEY)
      @url = URI(BASE_URL + endpoint)
      @url.query = URI.encode_www_form(params)
    end

    def request
      http = Net::HTTP.new(@url.host, @url.port)
      request = Net::HTTP::Get.new(@url)
      http.request(request)
    end
  end
end
