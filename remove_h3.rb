%w[rexml/document].each { |x| require x }

class Removehtags
	
	def initialize(basedir="_posts")
		@basedir = basedir || "."
	end
	
	def migrate
		
		contains = Dir.new(@basedir).entries	
		contains.each do |f|
			remove_tags f if f.include?('textile')
		end
	end
	
	def remove_tags(file_to_read)		
		puts "--- start removing tags on #{file_to_read} ---"
		
		File.read(file_to_read) 
		
		post = xml_to_post(xml)
		
		file_name = "../DynamicProg/_posts/#{post.created}-#{post.title_slug}.textile"
		
		File.new(file_name,'w+').write(post.header + "\r\n" + post.content)
		
		puts "--- Migration of #{file_to_read} done as #{file_name} ---"
	end
	
	def xml_to_post(xml)
		doc = REXML::Document.new(xml)

		title = doc.get_text('DayEntry/Entries/Entry/Title').to_s
		created =  doc.get_text('DayEntry/Entries/Entry/Created').to_s
		content =  doc.get_text('DayEntry/Entries/Entry/Content').to_s
		categories = doc.get_text('DayEntry/Entries/Entry/Categories').to_s
		
		Post.new(title, created, content,categories)
	end
end




migrate_entrie = Removehtags.new
migrate_entrie.migrate