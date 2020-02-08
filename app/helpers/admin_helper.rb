module AdminHelper
  def is_active_page?(path)
    'mm-active' if current_page?(path)
  end
end
