require 'date'

class FamilyDecorator < Draper::Decorator
  delegate_all
  decorates :family

	def anniversary
		if anniversary?
			return Date.parse(model.anniversary).to_formatted_s(:long)
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

	def updated_at
		return model.updated_at.to_datetime.to_date.to_formatted_s(:long)
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