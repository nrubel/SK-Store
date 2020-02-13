class Admin::SettingsController < AdminController
  def index
    @brand = Brand.first
    @navs = Navigation.all
    @menus = Menu.order(id: :asc).all
    @newMenu = Menu.new
  end
end
