class Post < ApplicationRecord
	validates_presence_of :date, :rationale

	def index

	end
end
