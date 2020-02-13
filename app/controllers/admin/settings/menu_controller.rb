class Admin::Settings::MenuController < AdminController
  def new
    @menu = Menu.new
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def create
    menu = Menu.new(menu_params)

    if menu.save
      redirect_to :admin_settings
    else
      flash[:menu_errors] = menu.errors
      goBack
    end
  end

  def update
    menu = Menu.find(params[:id])

    if menu.update(menu_params)
      redirect_to :admin_settings
    else
      flash[:errors] = menu.errors
      goBack
    end
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to :admin_settings
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :route, :position, :parent, :navigation_id)
  end
end
