class Admin::Settings::BrandController < AdminController
  def new
    if Brand.count > 0
      redirect_back fallback_location: admin_settings_path
    end
    @brand = Brand.new
  end

  def edit
    @brand = Brand.first
  end

  def create
    brand = Brand.new(brand_params)

    image_resizing(params[:brand][:logo])
    image_resizing(params[:brand][:admin_logo])

    if brand.save
      redirect_to :admin_settings
    else
      flash[:errors] = brand.errors
      flash[:values] = brand
      redirect_to :new_admin_settings_brand
    end
  end

  def update
    brand = Brand.find(params[:id])
    params[:brand].each do |k, v|
      brand[k] = v if brand[k] != v && k != 'logo' && k != 'admin_logo' && k != 'footer_logo'
    end

    update_logos(brand.logo, 'logo')
    update_logos(brand.admin_logo, 'admin_logo')
    update_logos(brand.footer_logo, 'footer_logo')

    if brand.save
      redirect_to :admin_settings
    else
      flash[:errors] = brand.errors
      flash[:values] = brand
      redirect_to :edit_admin_settings_brand
    end
  end


  private
  def brand_params
    params.require(:brand).permit(:title, :phone, :email, :logo, :admin_logo)
  end

  def image_resizing(attachment, size = '94x77')
    unless attachment.nil?
      mini_image2 = MiniMagick::Image.new(attachment.tempfile.path)
      mini_image2.resize size
    end
  end

  def update_logos(original, param)
    unless params[:brand][param].nil?
      original.purge
      original.attach( params[:brand][param] )
    end
  end
end
