class Post < ApplicationRecord
	belongs_to :user
	validates_presence_of :date, :rationale

	def index

	end
end
