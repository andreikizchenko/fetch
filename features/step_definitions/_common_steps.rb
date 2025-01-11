When(/^I run terminal command (.+) with option (.+)$/) do |command, option|
  @stdout, @stderr, @status = Open3.capture3("#{command} #{option}")
  # p @stdout
  # p @stderr
  # p @status
end

Then(/^output present in terminal$/) do
  expect(@stdout).not_to be_empty
end

Then(/^output absent in terminal$/) do
  expect(@stdout.delete("\n")).to be_empty
end

Then(/^error message present in terminal$/) do
  expect(@stderr).not_to be_empty
end

Then(/^error message absent in terminal$/) do
  expect(@stderr).to be_empty
end

Then(/^exit status code is (\d)$/) do |digit|
  expect(@status.exitstatus).to eq(digit.to_i)
end
