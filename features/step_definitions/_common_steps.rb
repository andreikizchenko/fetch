When(/^I run terminal command (.+) with option (.+)$/) do |command, option|
  @output = %x[#{command} #{option}]
end

Then(/^output present in terminal$/) do
  expect(@output).not_to be_empty
end