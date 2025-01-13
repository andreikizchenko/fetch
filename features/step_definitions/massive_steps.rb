When(/^I load (.+) file$/) do |file_path|
  file_content = File.read(file_path)
  @json_data = JSON.parse(file_content)
end

When(/^I run (\d+) commands "fetch --locations" with random zips from the file$/) do |number|
  @results = []
  @json_data.sample(number).each do |zip|
    stdout, stderr, status = Open3.capture3("fetch --locations #{zip}")
    @results << { zip: zip, stdout: stdout.strip, stderr: stderr, status: status.exitstatus }
  end
end

Then(/^all the valid requests output displayed correctly$/) do
  aggregate_failures 'massive test results' do
    @results.each do |result|
      zip = result[:zip]
      expect(result[:stdout]).not_to eq("Please enter valid location"), "Valid zip #{zip} output: #{result[:stdout]}"
      expect(result[:stderr]).to be_empty,                              "Valid zip #{zip} error: #{result[:stderr]}"
      expect(result[:status]).to eq(0),                                 "Valid zip #{zip} exit status: #{result[:status]}"
    end
  end
end

Then(/^all the invalid requests output displayed correctly$/) do
  aggregate_failures 'massive test results' do
    @results.each do |result|
      zip = result[:zip]
      expect(result[:stdout]).to eq("Please enter valid location"), "Invalid zip #{zip} output: \n#{result[:stdout]}"
      expect(result[:stderr]).to be_empty,                          "Invalid zip #{zip} error: #{result[:stderr]}"
      expect(result[:status]).to eq(0),                             "Invalid zip #{zip} exit status: #{result[:status]}"
    end
  end
end