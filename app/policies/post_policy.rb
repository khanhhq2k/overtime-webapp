class PostPolicy < ApplicationPolicy
  def update?
    record.user_id == user.id || ADMIN_USER_TYPES.include?(user.type)
  end
end