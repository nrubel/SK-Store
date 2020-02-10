class Admin::Settings::NavigationController < AdminController

  def show
    @nav = Navigation.find(params[:id])
  end

  def edit
    @nav = Navigation.find(params[:id])
  end

  def create
    nav = Navigation.new(nav_params)
    nav.name = params[:name]

    if nav.save
      goBack
    else
      flash[:nav_errors] = nav.errors.full_messages.first
      goBack
    end
  end

  def update
    nav = Navigation.find(params[:id])
    nam = params[:navigation][:name]
    if !nam.nil?
      nav.update! name: nam
      redirect_to admin_settings_path
    else
      flash[:errors] = "Name shouldn't be empty"
      goBack
    end
  end

  # def destroy
  #   nav = Navigation.find(params[:id])
  #   nav.destroy if nav
  #   goBack
  # end

  private
  def nav_params
    params.permit(:name)
  end

  def goBack
    redirect_back fallback_location: admin_settings_path
  end
end