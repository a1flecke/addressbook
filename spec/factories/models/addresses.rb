require 'faker'

FactoryGirl.define do
  factory :address do |f|
    f.name {Faker::Name.name}
    f.street {Faker::Address.street_address}
    f.city {Faker::Address.city}
    f.state {Faker::Address.state_abbr}
    f.zipCode {Faker::Address.zip}
  end

  factory :invalid_address, parent: :address do |f|
  	f.name nil
  end
end