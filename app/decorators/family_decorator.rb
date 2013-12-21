require 'date'

class FamilyDecorator < Draper::Decorator
  delegate_all
  decorates :family

	def anniversary
		if anniversary?
			return model.anniversary.to_date.to_formatted_s
		else
			return nil
		end
	end

	def addresses
		AddressDecorator.decorate_collection(model.addresses)
	end

	def phone_numbers
		return model.phoneNumbers
	end

	def updated_at
		return model.updated_at.to_datetime.to_date.to_formatted_s
	end

	def comments
		if model.comments.nil?
			[]
		else
			comments = []
			model.comments.each do |comment|
				comments << comment unless comment.value.nil?
			end
			comments
		end
	end
end