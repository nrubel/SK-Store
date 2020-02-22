class Admin::AttributeController < AdminController
  def index
    @attributes = Attribute.all
    @attribute = Attribute.new
  end

  def show
    @attribute = Attribute.find(params[:id])
  end

  def create
    attribute = Attribute.new(attribute_params)

    if attribute.save
      redirect_to :admin_attribute_index
    else
      flash[:errors] = attribute.errors.full_messages
      redirect_back fallback_location: :admin_attribute
    end
  end

  def update
    attribute = Attribute.find(params[:id])

    if params[:update_type]
      values = attribute.values || []

      label = params[:attribute][:values][:label]
      val = params[:attribute][:values][:value]
      type = params[:update_type]

      if type == 'new'
        if values.empty? || !values.any? {|v| v['label'] == label && v['value'] == val}
          if attribute.update! values: values << {:label => label, :value => val}
            redirect_to :admin_attribute
          else
            flash[:errors] = "Can't add"
            go_back
          end
        else
          flash[:errors] = 'Already exits'
          go_back
        end
      elsif type == 'delete'
        if !values.empty? && values.any? {|v| v['label'] == label && v['value'] == val}

          if attribute.update! values: values.delete_if {|v| v['label'] == label && v['value'] == val}
            redirect_to :admin_attribute
          else
            flash[:errors] = "Can't delete"
            go_back
          end

        end
      else
        flash[:errors] = "I am not sure what you wish for!"
        go_back
      end
    else
      if !params[:attribute][:name].nil?
        if attribute.update! name: params[:attribute][:name]
          redirect_to :admin_attribute
        else
          flash[:errors] = attribute.errors.full_messages.first
          go_back
        end
      else
        flash[:errors] = "Try again"
        go_back
      end
    end
  end

  def destroy
    attribute = Attribute.find(params[:id])
    attribute.destroy
    redirect_to :admin_attribute_index
  end
  
  private
  def go_back
    redirect_back fallback_location: :admin_attribute_index
  end
  def attribute_params
    params.require(:attribute).permit(:name)
  end
end
