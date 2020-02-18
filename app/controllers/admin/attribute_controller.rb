class Admin::AttributeController < AdminController
  def index
    @attributes = Attribute.all
  end

  def new
    @attribute = Attribute.new
  end

  def create
    attribute = Attribute.new(attribute_params)

    fail
  end

  private
  def attribute_params
    params.require(:attribute).permit(:name, :values)
  end
end
