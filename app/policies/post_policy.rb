class PostPolicy < ApplicationPolicy
  def update?
    #logic for update:
    #admin can update any records, despite record's status
    #users can only edit their records and the records status must not be approved yet
    is_admin? || (is_owner? && !post_approved?)
  end

  private
  def is_admin?
    ADMIN_USER_TYPES.include?(user.type)
  end
  def is_owner?
    record.user_id == user.id
  end
  def post_approved?
    record.approved?
  end
end