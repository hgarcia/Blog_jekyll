require 'liquid'
require 'fleakr'

Fleakr.api_key       = "fef6644edfac9a21a909f8152719aaa3"
Fleakr.shared_secret = "f8b4bfef2df015b9"

CACHED_IMAGES = {}
SIZES = {:square => "Square", :large_square => "Large Square", :thumbnail => "Thumbnail", :small =>
"Small", :small320 => "Small 320", :medium => "Medium", :medium640 => "Medium 640", :medium800 => "Medium 800", :large => "Large", :large1600 => "Large 1600", :large2048 => "Large 2048", :original => "Original"}

module Flickr
  @printed = false
  def flickr_url(image_id)
    "http://www.flickr.com/photos/theprogrammer/#{image_id}"
  end

  def flickr_img(image_id, size = nil)
    img = image_object(image_id, get_size_segment(size.downcase.to_sym))
    image_tag(img[:title], img[:url])
  end

  private

  def get_size_segment(symbol)
    SIZES[symbol]
  end

  def image_object(image_id, size)
    url = flickr_url(image_id)
    resource = CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
    if (resource)
      image = resource.images.find do |img| img.size == size end
      {:title => resource.title, :url => image.url}
    else
      {:title => "not found", :url => "#"}
    end
  end

  def image_tag(title, url)
    "<img alt='#{title}' src='#{url}'>"
  end
end

Liquid::Template.register_filter(Flickr)