module Admin::SettingsHelper
  def goBack
    redirect_back fallback_location: admin_settings_path
  end
end
