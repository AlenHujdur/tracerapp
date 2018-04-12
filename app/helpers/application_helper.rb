module ApplicationHelper

  def picture_for(location, options = { size: 80 })
      size = options[:size]
      if location.image.url == nil
        return "No image!"
      else
        image_tag(location.image.url, alt: location.info)
      end
  end

end
