require 'date'

class FamilyDecorator < Draper::Decorator
  delegate_all
  decorates :family

	def anniversary
		if anniversary?
			return Date.strptime(model.anniversary,format='%m/%d/%Y').to_formatted_s(:long)
		else
			return nil
		end
	end

	def phone_numbers
		return model.phoneNumbers
	end

	def created_at
		return model.created_at.to_datetime.to_date.to_formatted_s(:long)
	end

end