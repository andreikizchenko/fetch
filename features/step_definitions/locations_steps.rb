Then(/^fetch locations single location output present in terminal$/) do
  expect(@stdout).not_to be_empty
end

Then(/^fetch locations multiple locations output present in terminal$/) do
  locations = @stdout.strip.split("\n\n")
  expect(locations.size).to be > 1
end

Then(/^correct fetch locations single location output present in terminal$/) do
  array = @stdout.strip.split("\n")
  array.map! { |line| key, value = line.split(':', 2); [key.strip, value.strip] }
  @location = array.to_h
  expect(@location).not_to be_empty
end

Then(/^fetch locations output includes parameters (.+)$/) do |params_string|
  @parameters = params_string.split(', ')

  aggregate_failures 'required parameters present' do
    @parameters.each do |parameter|
      expect(@location).to include(parameter)
    end
  end
end

Then(/^fetch locations output includes value for each parameter$/) do
  aggregate_failures 'required values present' do
    @parameters.each do |parameter|
      expect(@location[parameter]).not_to be_empty
    end
  end
end