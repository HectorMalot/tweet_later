Given /^I am at my dashboard$/ do
  visit '/dashboard'
end

When /^I post a new tweet$/ do
  fill_in 'tweet', with:'I am tweeting right now'
  click_button 'Tweet'
end

Then /^the tweet should be posted immediately$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I post a new tweet to be tweeted in (\d+) hours?$/ do |hours|
  pending # express the regexp above with the code you wish you had
end

Then /^the tweet should be scheduled for posting in (\d+) hours?$/ do |hours|
  pending # express the regexp above with the code you wish you had
end

Given /^I have posted a new tweet to be tweeted in (\d+) hours?$/ do |hours|
  pending # express the regexp above with the code you wish you had
end

When /^I change the time by (\d+) hours?$/ do |hours|
  pending # express the regexp above with the code you wish you had
end