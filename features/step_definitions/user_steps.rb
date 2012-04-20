Given /^I am signed in$/ do
  @user = FactoryGirl.create :user
  sign_in @user
end

Given /^I am not signed in$/ do
  visit('/sign_out')
end

Given /^I am at the homepage$/ do
  visit('/')
end

Given /^A user with uid '(\d+)' exists$/ do |uid|
  FactoryGirl.create(:user, :uid => uid.to_s)
end

When /^I sign in using twitter with valid credentials$/ do
  step %{I click "sign in"}
end

Then /^I should see my dashboard$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should be signed in$/ do
  page.should have_content('sign out')
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
  pending
end