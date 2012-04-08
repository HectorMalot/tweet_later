FactoryGirl.define do
  factory :user do
    name              		 "ExampleUser"
  end
  sequence :email do |n|
    "person-#{n}@example.com"
  end
end