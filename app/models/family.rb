class Family < ActiveRecord::Base
  has_many :comments
  has_many :families
  has_many :addresses
  has_many :tags
  has_many :phoneNumbers
  has_many :people
  
end
