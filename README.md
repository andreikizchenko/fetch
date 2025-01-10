Given this Open Weather Geocoding API (https://openweathermap.org/api/geocoding-api)

input: please write a utility that takes a city, state, or zip code
output: returns the latitude, longitude, place name, and any other necessary information from the API.

Your utility should make use of the Coordinates by location name and the Coordinates by zip/post code endpoints.
Your program should also be able to handle multiple location inputs.

Limit the location scope to be within the United States.

In the event that multiple locations are returned by the API, you can use the first result in the list of returned locations.

Add limitations to this file as per spec document


my_cli_app/
├── bin/
│   └── my_cli_app       # Main executable file
├── lib/
│   ├── my_cli_app/
│   │   ├── version.rb   # Versioning information
│   │   ├── cli.rb       # CLI logic and command definitions
│   │   └── other_file.rb # Additional logic or helpers
│   └── my_cli_app.rb    # Main entry point for the application
├── spec/                # RSpec tests
│   ├── my_cli_app/
│   │   ├── cli_spec.rb  # Tests for the CLI logic
│   │   └── other_spec.rb # Tests for other logic or helpers
│   └── spec_helper.rb   # RSpec configuration
├── Gemfile              # Dependency management
├── Gemfile.lock         # Locked dependencies
├── README.md            # Documentation for the project
├── .gitignore           # Files and folders to ignore in Git
└── my_cli_app.gemspec   # Optional: Defines the gemspec for the app

./bin/fetch_cli foo greet Name Age - dockerize and remove the first part of the command

add gitignore file and other git related files

Remove greet command

Remove test.rb file

export PATH="/Users/andrei/RubymineProjects/test/fetch/bin:$PATH"
