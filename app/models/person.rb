class Person < ActiveRecord::Base
  has_many :emails
  has_many :phoneNumbers
  has_many :tags
end
