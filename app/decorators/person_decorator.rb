require 'date'

class PersonDecorator < Draper::Decorator
  delegate_all
  decorates :person

  def birthday
    if birthday?
      return model.birthday.to_date.to_formatted_s
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
    return model.updated_at.to_datetime.to_date.to_formatted_s
  end
end