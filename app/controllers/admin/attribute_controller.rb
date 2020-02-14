class Admin::AttributeController < AdminController
  def index
    @attributes = Attribute.all
  end
end
