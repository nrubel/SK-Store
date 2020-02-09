class Admin::MediaController < AdminController
  require 'mini_magick'

  def index
    @files = MediaItem.all.with_attached_media
  end

  def new
    @media = MediaItem.new
  end

  def create
    mediaItems = MediaItem.new(media_params)

    params[:media_item][:media].each do |image|
      mini_image = MiniMagick::Image.new(image.tempfile.path)
      if mini_image[:width].to_f > 1000.00
        mini_image.resize '1000x1000'
      end
      mini_image.data
    end

    if mediaItems.save
      redirect_to :admin_media
    else
      flash[:errors] = mediaItems.errors.full_messages
      redirect_back fallback_location: :root
    end
  end

  def destroy
    @image = ActiveStorage::Blob.find(params[:id])
    @image.purge
    # redirect_to :admin_media
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to :admin_media
  end

  private
  def media_params
    params.require(:media_item).permit(media: [])
  end
end
