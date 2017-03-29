FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
  	city { Faker::Address.city }
  	email { Faker::Internet.email }
  	password { Faker::Internet.password }
  end

  factory :invalid_user, parent: :user do |f|
    name nil
  end
end