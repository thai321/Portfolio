module PortfolisHelper
  def image_generator(height:, width: )
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.model.thumb_image? || img.model.main_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200') # thumb_image
    elsif type == 'main'
      image_generator(height: '600', width: '400') # main_image
    end
  end
end
