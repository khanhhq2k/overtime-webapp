class Post < ApplicationRecord
	belongs_to :user
	validates_presence_of :date, :rationale
  enum status: { submitted: 0, approved: 1, rejected: 2 }
  scope :user_posts, ->(user) {where(user_id: user.id)}
end
