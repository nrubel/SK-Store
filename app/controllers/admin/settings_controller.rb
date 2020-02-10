class Admin::SettingsController < AdminController
  def index
    @brand = Brand.first
    @navs = Navigation.all
    @newNav = Navigation.new
  end
end
