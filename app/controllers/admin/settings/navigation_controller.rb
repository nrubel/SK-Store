class Admin::Settings::NavigationController < AdminController

  def create
    nav = Navigation.new(nav_params)

    if Navigation.find_by_name! params[:name]
      flash[:nav_errors] = "Already in record, try with a new name or edit"
      goBack
    else
      nav.name = params[:name]
      if nav.save
        goBack
      else
        flash[:nav_errors] = nav.errors.full_messages.first
        goBack
      end
    end
  end

  def destroy
    nav = Navigation.find(params[:id])
    nav.destroy if nav
    goBack
  end

  private
  def nav_params
    params.permit(:name)
  end

  def goBack
    redirect_back fallback_location: admin_settings_path
  end
end