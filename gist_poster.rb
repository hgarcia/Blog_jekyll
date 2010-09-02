require 'net/http'
require 'uri'
%w[rexml/document].each { |x| require x }


# /api/v1/:format/new
# /api/v1/:format/gists/:user
# /api/v1/:format/:gist_id
                                                 
res = Net::HTTP.post_form(URI.parse('http://hgarcia:gong696stew773@gist.github.com/api/v1/xml/new'),
{ 'files[cucumber.fixture]' => '	@wipScenario: Assign roles Given the following roles exist 
		| name      | 
		| admin     | 
		| reader    | 
		| publisher | 
		When I am on the roles page 
		Then I should see "admin" 
		And I should see "reader" 
		And I should see "publisher"',
'files[steps.rb]' => '	# create models from a table
	Given(/^the following #{capture_plural_factory} exists?:?$/) do |plural_factory, create_models_from_table(plural_factory, table) |
	end',
	'description' => 'Pickle cucumber steps not recognized' })


puts res.body


doc = REXML::Document.new(res.body)

repo = doc.get_text('gists/gist/repo').to_s
root = doc.root

root.each_element('//file/file') do |item|
	file = item.get_text().to_s 
	puts "<script src='http://gist.github.com/#{repo}.js?file=#{file}'></script>"
end