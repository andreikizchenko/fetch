# Fetch project
## General info
This project is a home assignment for the SDETs positions.   
See document `Fetch_Coding_Exercise_SDET_v2.pdf` for more details.

### Part 1 - Dev Assignment
As the first part of the assignment, `command line utility` `(CLI)` is developed.  
Since there are no restrictions on the programming language, I used Ruby.  
Let me know if you want to see the implementation using the other language.

### Part 2 - Test Assignment
As the second part of the assignment, automation test are developed using `cucumber`, `rspec`, etc.  
According to the requirements, I chose to use single repository for both utility and the test code.  

## Environment Setup
### Local
1. Make sure `ruby 2.7.6` installed on local machine
2. Install bundler gem using terminal command `gem install bundler -v 2.1.4`
3. Pull repository code to your local machine
4. From the project root, run the terminal command `bundle` to install required gems
5. Add bin path to your PATH in `~/.zshrc` file, Example: `export PATH="$HOME/RubymineProjects/fetch/bin:$PATH"`
6. Run terminal command `source ~/.zshrc` to update your PATH variable
7. Run the app or tests using the commands described in `Running Fetch CLI App` and `Running Tests` sections

### Docker (preferred)
1. Install docker
2. Pull repository code to your local machine
3. In terminal, from the project root, run script `./docker-local-app.sh`
4. Run the app or tests using the commands described in Running app and Running tests sections

## Development
### General Info
The development of fetch CLI utility can be logically separated into three parts:  
- CLI utility: `bin/fetch`, `lib/fetch.rb` and files in `lib/fetch` directory  
Uses third party gem `dry-cli` to create DSL for cli commands  
- API client: `lib/api/client.rb` and files in `lib/api/endpoint` directory  
Uses Ruby standard libraries `net/http`, `uri`, `json` to call the APIs  
- Utility helper to connect the previous two parts: `lib/utils/location_helper.rb`  
Helper class which provides distribution between APIs and output format logic   

NOTE: Since this is not a production grade version, there are some hardcoded values  
They definitely can be moved to the separate config profile and if sensitive to the secure storage   

### Running Fetch CLI App
To run cli use command `fetch`  
For more details use `fetch --help`  
Currently there are two commands supported: 
 - `fetch --version` - returns current version of the app 
 - `fetch --locations LOCATION` - returns multiple locations for names and/or zips codes

## Testing
### General Info
NOTE: there are no unit test implemented as required per assignment.  
Integration tests are written using `cucumber`, `json`, `open3`, `rspec/expectations`, etc.  

Feature files location: `features/directory/**/*.feature`  
Step definitions location: `features/step_definitions/*_steps.rb`  

The folder structure looks complicated for such a small app. However, it is created intentionally to demonstrate
an ability to cover large amount of commands and keep test code clean and organized.  
Cucumber tags are used to categorize the tests which adds an ability to simply splits the tests for parallel execution
in the future.  
Cucumber steps are organized into action and verification ones. Also, tests written in active and passive voice
to keep feature files unified.  
Each verification step contain RSpec expectation to uniform error messages output.  
In cases where multiple verification required, aggregate_failures are used.
Since there are not a lot of requirements provided. These tests cover just the most obvious scenarios.
There might be other scenarios and verifications added as required.

Please pay separate attention to the file `features/directory/locations/locations_massive.feature`.  
This feature is written as an example of massive testing using local files with all valid and invalid zip codes.
Since such tests are time consuming and can possibly hit an API rate limit, they are currently limited to use 10 random zip codes
from the list. These types of test are written for demo purposes, so similar tests may be written for locations name command if required.  

### Running Tests
Just use standard cucumber commands:  
For the terminal output: `bundle exec cucumber --publish-quiet`  
To generate html report: `bundle exec cucumber --publish-quiet -f html -o runs/cucumber_report.html`  
To run test for separate cli commands, tags can be used, Ex: `bundle exec cucumber --publish-quiet -t @locations`  

NOTE: Some of the test intentionally left in failing state to demonstrate error message output.

Don't hesitate to contact me for any setup hel or any additional comments!  
Thank you for reviewing my work!
