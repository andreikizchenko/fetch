Then(/^correct fetch version output present in terminal$/) do
  expect(@stdout.delete("\n")).to eq(Fetch::VERSION)
end