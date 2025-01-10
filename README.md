Given this Open Weather Geocoding API (https://openweathermap.org/api/geocoding-api)

input: please write a utility that takes a city, state, or zip code
output: returns the latitude, longitude, place name, and any other necessary information from the API.

Your utility should make use of the Coordinates by location name and the Coordinates by zip/post code endpoints.
Your program should also be able to handle multiple location inputs.

Limit the location scope to be within the United States.

In the event that multiple locations are returned by the API, you can use the first result in the list of returned locations.

Add limitations to this file as per spec document

Don't forget to `export PATH="~/RubymineProjects/test/fetch/bin:$PATH"` to `~/.zshrc`

Testing direct push restriction
