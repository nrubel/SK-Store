class Admin::SettingsController < AdminController
  def index
    @settings = Brand.first
  end
end
