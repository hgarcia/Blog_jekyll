require 'liquid'
require 'fleakr'

Fleakr.api_key       = "fef6644edfac9a21a909f8152719aaa3"
Fleakr.shared_secret = "f8b4bfef2df015b9"

CACHED_IMAGES = {}

module Flickr

  def flickr_url(image_id)
    "http://www.flickr.com/photos/theprogrammer/#{image_id}"
  end

  def flickr_img(image_id, size = nil)
    img = image_object(image_id)
    url = img.send(size).url if img.respond_to? size
    image_tag(img.title, url)
  end

  private

  def get_size_segment(symbol)
    SIZE_SEGMENTS[symbol]
  end

  def image_object(image_id)
    url = flickr_url(image_id)
    CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
  end

  def image_tag(title, url)
    "<img alt='#{title}' src='#{url}'>"
  end
end

Liquid::Template.register_filter(Flickr)
