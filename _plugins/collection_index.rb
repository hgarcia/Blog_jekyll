require 'liquid'

module CollectionIndex
 
  
  def collection_index(posts, collection, blog_url)
    "<ul class=\"collection-list\">#{build_list_items(posts, collection, blog_url)}</ul>" 
  end

  private

  def build_list_items(posts, collection, blog_url)
    filtered = posts.select{ |p| p.to_liquid["collection"] == collection }.reverse
      .map{ |p| "<li><a href=\"#{blog_url}#{p.url}\">#{p.to_liquid["title"]}</a></li>"}.join
  end

end

Liquid::Template.register_filter(CollectionIndex)