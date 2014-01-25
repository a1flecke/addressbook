class Family < ActiveRecord::Base
  has_many :comments
  has_many :people
  has_many :addresses
  has_many :phoneNumbers
  
  def self.id_mapping
    families = Family.all
    return [] if families.empty?
    ids = families.map{|family| family.id}
    name = families.map{|family| family.name}
    ids.zip(name)
  end

end
