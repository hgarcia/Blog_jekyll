require 'liquid'
require 'flickr'
#require 'fleakr'

# Fleakr.api_key       = "fef6644edfac9a21a909f8152719aaa3"
# Fleakr.shared_secret = "f8b4bfef2df015b9"

# flickr = Flickr.new("fef6644edfac9a21a909f8152719aaa3")
API_KEY = 'fef6644edfac9a21a909f8152719aaa3'
CACHED_IMAGES = {}
SIZES = {:square => "Square", :large_square => "Large Square", :thumbnail => "Thumbnail", :small =>
"Small", :small320 => "Small 320", :medium => "Medium", :medium640 => "Medium 640", :medium800 => "Medium 640", :large => "Large", :large1600 => "Large", :large2048 => "Large", :original => "Large", :panoramic => "Large"}

module Flickr
  @printed = false
  # def flickr_url(image_id)
    # "http://www.flickr.com/photos/theprogrammer/#{image_id}"
  # end

  def flickr_img(image_id, size = :medium, attrs = {})
    img = image_object(image_id, get_size_segment(size.downcase.to_sym))
    attrs[:style] = "height: 175px;" if (size == "panoramic")
    image_tag(img[:title], img[:url], attrs)
  end

  private

  def get_size_segment(symbol)
    SIZES[symbol]
  end

  def image_object(image_id, size)
    # url = flickr_url(image_id)
    # resource = CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
    # if (resource)
      # image = resource.images.find do |img| img.size == size end
      begin
        resource = CACHED_IMAGES[url] ||= Photo.new(image_id, API_KEY).size_url(size)
        return {:title => resource.title, :url => image.url}
      rescue => e
        p "IMAGE NOT FOUND: id: #{image_id} - size: #{size} - url: #{url}"
        {:title => "not found", :url => "#"}
      end
    # else
      # {:title => "not found", :url => "#"}
    # end
  end

  def image_tag(title, url, attrs)
    "<img alt='#{title}' src='#{url}' #{image_attrs(attrs)}>"
  end

  def image_attrs(attrs)
    string_of_attributes = ""
    attrs.each {|k, v| string_of_attributes += "#{k}=\"#{v}\""}
    string_of_attributes
  end
end

Liquid::Template.register_filter(Flickr)
