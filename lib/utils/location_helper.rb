require_relative "../api/endpoint/location_name"
require_relative "../api/endpoint/zip_code"

class LocationHelper
  def initialize(location)
    @location = location
  end

  def data
    data = zip_code? ? zip_code : name
    data ? data_string(data) : message_string
  end

  private

  def zip_code?
    @location.match?(/^\d{5}$/)
  end

  def zip_code
    response = API::Endpoint::ZipCode.new(@location).response
    response.values.include?("404") ? nil : response
  end

  def name
    city = @location.split(',').first
    state = @location.split(',').last
    response = API::Endpoint::LocationName.new(city, state).response
    (response.nil? || response.include?("404")) ? nil : response
  end

  def message_string
    "\nPlease enter valid location"
  end

  def data_string(data)
    format = %w[name state lat lon country]
    raw_data = data.slice(*format)
    string = raw_data.map { |k, v| "#{k.capitalize}: #{v}" }.join("\n")
    string.prepend("\n")
  end
end
