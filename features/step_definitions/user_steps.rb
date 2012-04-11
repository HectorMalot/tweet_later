Given /^I am signed in$/ do
  user = FactoryGirl.create :user
  sign_in user
end

Given /^I am not signed in$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I am at the homepage$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click sign in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be redirected to twitter$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I successfully sign in using twitter$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see my dashboard$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I try to sign in using twitter with invalid credentials$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not be signed in$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be redirected to the homepage$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I click the sign out link$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be signed out$/ do
  pending # express the regexp above with the code you wish you had
end

def sign_in(user)
  @current_user = user
end