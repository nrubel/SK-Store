module ApplicationHelper
  def is_customer?
    !current_user.role?
  end

  def is_admin?
    current_user.role?
  end
end
