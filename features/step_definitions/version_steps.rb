Then(/^correct fetch version output present in terminal$/) do
  expect(@output.delete("\n")).to eq(Fetch::VERSION)
end