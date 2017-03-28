FactoryGirl.define do
  factory :playdate do
  	location { Faker::Address.city }
  	date { Faker::Date.forward(8) }
  	description { Faker::RickAndMorty.quote }
  	title { Faker::RickAndMorty.character }
    user_id { User.first.id }
  end
end
