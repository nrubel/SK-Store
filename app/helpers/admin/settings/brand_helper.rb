module Admin::Settings::BrandHelper
  def new_field_value(obj, key)
    obj[key] if !obj.nil? && obj.any? && obj[key]
  end
end
