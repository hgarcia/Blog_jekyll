require 'net/http'
require 'uri'
%w[rexml/document].each { |x| require x }

class GetCode
	
	def initialize(basedir="highlight")
		@basedir = basedir || "highlight"
	end
	
	def parse	
		contains = Dir.new(@basedir).entries	
		contains.each do |f|
			create_file f if f.include?('.textile')
		end
	end
	
	def create_file(file_to_read)		
		@content = File.read(@basedir + "/" + file_to_read)
		i = 0
		files_to_gist = {}
		files_to_gist['description'] = file_to_read
		while(highlights = /\{% highlight (.*?) %\}(.*?)\{% endhighlight %\}/m.match(@content)) do
			files_to_gist["files[file#{i}.#{$1}]"] = $2
			@content = @content.gsub(highlights.to_s,"::file#{i}.#{$1}::" )
			i += 1
		end
		repo = gist(files_to_gist)
		
		files_to_gist.each do |item|
			key = item[0].gsub(']','').gsub('files[','')
			@content = @content.gsub("::#{key}::","\r\n<script src='http://gist.github.com/#{repo}.js?file=#{key}'></script>\r\n")
		end
		
		File.new("h-removed/#{file_to_read}",'w+').write(@content)

	end
	
	def gist(data)
		res = Net::HTTP.post_form(URI.parse('http://hgarcia:gong696stew773@gist.github.com/api/v1/xml/new'),data)

		doc = REXML::Document.new(res.body)
		doc.get_text('gists/gist/repo').to_s
		
	end
	
end


code = GetCode.new
code.parse