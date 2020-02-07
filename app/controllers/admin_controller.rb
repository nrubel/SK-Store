class AdminController < ActionController::Base
  before_action :authenticate_user!
  before_action :is_admin

  def index

  end

  private
  def is_admin
    redirect_to root_path if current_user.role != 1
  end
end