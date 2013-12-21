require 'date'
require 'date_decorator'

class FamilyDecorator < Draper::Decorator
	include DateDecorator
  delegate_all
  decorates :family

	def anniversary
		if anniversary?
			return decorate_date(model.anniversary)
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
		return decorate_date(model.updated_at)
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