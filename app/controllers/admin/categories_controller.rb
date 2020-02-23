class Admin::CategoriesController < AdminController
  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    category = Category.new(category_params)

    if category.save
      redirect_to :admin_categories
    else
      flash[:errors] = category.errors.messages
      redirect_back fallback_location: :admin_categories
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to :admin_categories
  end

  private
  def category_params
    params.require(:category).permit(:name, :slug)
  end
end
