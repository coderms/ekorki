class DataController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def image
    ad = Ogloszenie.find(params[:id])
    photo = ad.photo
    
    if photo.nil?
      photo = read_upload(no_image_avail_path)
    end
    
    render :text => photo
  end
  
  def no_image_avail_path
    "#{Rails.root}/app/assets/images/noimageavail25.png"
  end
end
