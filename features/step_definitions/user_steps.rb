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

When /^I try to sign in using twitter with invalid credentials$/ do
  OmniAuth.config.mock_auth[:twitter] = :authentication_failed
  step %{I click "sign in"}
end

When /^I click the sign out link$/ do
  click_link 'sign out'
end

Then /^I should see my dashboard$/ do
  current_path.should == '/dashboard'
end

Then /^I should be signed in$/ do
  page.should have_content('sign out')
end

Then /^I should be signed out$/ do
  page.should have_content('sign in')
end

Then /^I should not be signed in$/ do
  page.should_not have_content('sign out')
end

Then /^I should be at the homepage$/ do
  current_path.should == '/'
end

Then /^I should see an error message$/ do
  page.should have_content('Error')
end


def sign_in(user)
  step %{I am not signed in}
  step %{I am at the homepage}
  step %{I sign in using twitter with valid credentials}
end