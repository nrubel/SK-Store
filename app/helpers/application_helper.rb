module ApplicationHelper
  def is_customer?
    current_user.role == 0
  end

  def is_admin?
    current_user == 1
  end
end
