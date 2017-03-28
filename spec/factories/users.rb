FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
  	city { Faker::Address.city }
  	email { Faker::Internet.email }
  	password_digest { Faker::Internet.password }
  end
end