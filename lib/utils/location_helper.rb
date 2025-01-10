require_relative "../api/endpoint/location_name"
require_relative "../api/endpoint/zip_code"

class LocationHelper
  def initialize(location)
    @location = location
  end

  def data
    data = zip_code? ? zip_code : location_name
    format = %w[name state lat lon country]
    raw_data = data.slice(*format)
    formatted_data(raw_data)
  end

  private

  def zip_code?
    @location.match?(/^\d+$/)
  end

  def zip_code
    API::Endpoint::ZipCode.new(@location).info
  end

  def location_name
    city = @location.split(',').first
    state = @location.split(',').last
    API::Endpoint::LocationName.new(city, state).info
  end

  def formatted_data(data)
    string = data.map { |k, v| "#{k.capitalize}: #{v}" }.join("\n")
    string.prepend("\n")
  end
end
