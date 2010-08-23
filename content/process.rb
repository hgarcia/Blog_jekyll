%w[rexml/document].each { |x| require x }

class MigrateEntries
	
	def initialize(basedir=".")
		@basedir = basedir || "."
	end
	
	def migrate
		
		contains = Dir.new(@basedir).entries	
		contains.each do |f|
			create_file f if f.include?('dayentry')
		end
	end
	
	def create_file(file_to_read)		
		puts "--- start migration on #{file_to_read} ---"
		
		xml = File.read(file_to_read) 
		
		post = xml_to_post(xml)
		
		file_name = "../_posts/#{post.created}-#{post.title_slug}.textile"
		
		File.new(file_name,'w+').write(post.header + "\r\n" + post.content)
		
		puts "--- Migration of #{file_to_read} done as #{file_name} ---"
	end
	
	def xml_to_post(xml)
		doc = REXML::Document.new(xml)

		title = doc.get_text('DayEntry/Entries/Entry/Title').to_s
		created =  doc.get_text('DayEntry/Entries/Entry/Created').to_s
		content =  doc.get_text('DayEntry/Entries/Entry/Content').to_s
		
		Post.new(title, created, content)
	end
end

class Post

	def initialize(title,created,content)
		@title, @created = title, created
		@content = content.strip.gsub('&lt;','<').gsub('&gt;','>').gsub('<p>','').gsub('</p>',"\r\n").gsub(/&amp;#160;/,'').gsub(/&amp;nbsp;/,'').gsub(/<\!--dotnetkickit-->/,'').gsub(/<\!--more-->/,'')
	end
	
	def title_slug
		@title.downcase.gsub(' ','-').gsub(/&amp;/,'and').gsub(/[\/\:\,\?\!\'\`\’\.]/,'-')
	end
	
	def header
		header = """---
layout: post
title: #{@title.gsub(':','-')}
summary: #{@content.gsub(/<pre>.*<\/pre>/s,"").gsub(/<\/?[^>]*>/, "").gsub("\r\n"," ").slice(0..245).gsub(':','-')
}...
---"""
		header
	end
	
	def title
		@title
	end
	
	def created
		@created.slice(0..9)
	end
	
	def content
		@content.gsub(/content\/binary/,"../../../images/posts").gsub(/http:\/\/blog.dynamicprogrammer.com\//,'').gsub(/WindowsLiveWriter\//,'')
	end
end


migrate_entrie = MigrateEntries.new
migrate_entrie.migrate