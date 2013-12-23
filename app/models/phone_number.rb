class PhoneNumber < ActiveRecord::Base
  has_one :person
  has_one :family
  
  validates :name, :presence => true
  validates :value, :presence => true

  scope :for_family, ->(family){where("family_id = ?", family.id)}
  scope :for_person, ->(person){where("person_id = ?", person.id)}  
  
end
