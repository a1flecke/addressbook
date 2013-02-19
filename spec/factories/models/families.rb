require 'faker'

FactoryGirl.define do
  factory :family do |f|
    f.name {Faker::Name.name}
  end

  factory :invalid_family, parent: :family do |f|
  	f.name nil
  end
end