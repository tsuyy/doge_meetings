FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
  	city "San Francisco"
  end
end