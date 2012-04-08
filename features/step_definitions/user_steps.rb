Given /^I am signed in$/ do
  user = FactoryGirl.create :user
  sign_in user
end

def sign_in(user)
  @current_user = user
end