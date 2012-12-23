class Email < ActiveRecord::Base
  has_one :person
end
