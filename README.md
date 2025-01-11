# Fetch project
## General info
This project is a home assignment for the SDETs positions.   
See document `Fetch_Coding_Exercise_SDET_v2.pdf` for more details.

### Part 1 - Dev Assignment
As the first part of the assignment, `command line utility` `(CLI)` is developed.  
Since there are no restrictions on the programming language, I used Ruby.  
Let me know if you want to see the implementation using the other language.

### Part 2 - Test Assignment
As the second part of the assignment, automation test are developed using `cucumber`.  
According to the requirements, I chose to use single repository for both utility and the test code.  

## Environment Setup
1. Make sure `ruby 2.7.6` installed on local machine
2. Install bundler gem using terminal command `gem install bundler -v 2.1.4`
3. Pull repository code to your local machine
4. From the project root, run the terminal command `bundle` to install required gems
5. Add bin path to your PATH in `~/.zshrc` file, Example: `export PATH="$HOME/RubymineProjects/fetch/bin:$PATH"`
6. Run terminal command `source ~/.zshrc` to update your PATH variable
7. Verify fetch app is working by running `fetch --version`

## Development
### General Info
The development of fetch CLI utility can be logically separated into three parts.
- CLI utility: `bin/fetch`, `lib/fetch.rb` and files in `lib/fetch` directory  
Uses third party gem `dry-cli` to create DSL for cli commands
- API client: `lib/api/client.rb` and files in `lib/api/endpoint` directory  
Uses Ruby standard libraries `net/http`, `uri`, `json` to call the APIs
- Utility helper to connect the previous two parts: `lib/utils/location_helper.rb`  
Helper class which provides distribution between APIs and output format logic 

NOTE: Since this is not a production grade version, there are some hardcoded values  
They definitely can be moved to the separate config profile and if sensitive to the secure storage   

### Running Fetch CLI
To run cli use command `fetch`  
For more details use `fetch --help`  
Currently there are two commands supported: 
 - `fetch --version` - returns current version of the app 
 - `fetch --locations LOCATION` - returns multiple locations for names and/or zips 

## Testing
### General Info
### Running Tests
TBD
Mention absence of unit tests due to requirement
