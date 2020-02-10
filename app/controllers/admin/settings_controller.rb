class Admin::SettingsController < AdminController
  def index
    @brand = Brand.first
  end
end
