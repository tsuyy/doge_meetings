FactoryGirl.define do
  factory :dog do
  	name { Faker::RickAndMorty.character }
  	user_id { User.first.id }
  	age { Faker::Number.between(1, 10) }
  	breed { Faker::Pokemon.name }
    sex { Faker::Name.first_name }
    vaccinated { Faker::Boolean.boolean }
    neutered { Faker::Boolean.boolean }
    weight { Faker::Number.between(1, 10) }
    temperament { Faker::Hipster.word }
  end
end
