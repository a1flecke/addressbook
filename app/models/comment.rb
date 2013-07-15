class Comment < ActiveRecord::Base
  has_one :family

  scope :for_family, ->(family){where("family_id = ?", family.id)}

end
