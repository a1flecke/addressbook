require 'date'
require 'date_decorator'

class PersonDecorator < Draper::Decorator
  include DateDecorator
  delegate_all
  decorates :person

  def birthday
    if birthday?
      return decorate_date(model.birthday)
    else
      return nil
    end
  end

  def phone_numbers
    return model.phoneNumbers
  end

  def name
    "#{first_name} #{last_name}"
  end

  def first_name
    model.firstName
  end

  def last_name
    model.lastName
  end

  def nick_name
    model.nickname
  end

  def family
    if family_id?
      return FamilyDecorator.decorate(model.family)
    else
      return nil
    end
  end

  def updated_at
    return decorate_date(model.updated_at)
  end
end