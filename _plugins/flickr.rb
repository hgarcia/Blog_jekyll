require 'liquid'
require 'fleakr'

Fleakr.api_key       = "fef6644edfac9a21a909f8152719aaa3"
Fleakr.shared_secret = "f8b4bfef2df015b9"

CACHED_IMAGES = {}

module Flickr

  def flick_url(image_id)
    "http://www.flickr.com/photos/theprogrammer/#{image_id}"
  end

  def flickr_original(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.original.url)
  end

  def flickr_large(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.large.url)
  end

  def flickr_medium(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.medium.url)
  end

  def flickr_small(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.small.url)
  end

  def flickr_thumb(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.thumbnail.url)
  end

  def flickr_square(image_id)
    img = image_object(image_id)
    image_tag(img.title, img.square.url)
  end

  private

  def image_object(image_id)
    url = flick_url(image_id)
    CACHED_IMAGES[url] ||= Fleakr.resource_from_url(url)
  end

  def image_tag(title, url)
    "<img alt='#{title}' src='#{url}'>"
  end
end

Liquid::Template.register_filter(Flickr)
