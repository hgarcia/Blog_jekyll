require 'rubygems'
require 'git'
require 'twitter'
require 'nokogiri'
require 'open-uri'
require 'erb'
require File.dirname(__FILE__) + '/tweet_config.rb'

task :default => 'build:deploy'

namespace :build do

  desc 'Pre building the site for local testing'
	task :pre => [:merge_and_minimize_css] do
		sh 'jekyll'
	end

	desc 'Minimizing and combining css files'
	task :merge_and_minimize_css do
		sh 'juicer merge assets/css/master.css --force'
	end

	desc 'Add changes commit and push to github'
	task :github => [:merge_and_minimize_css] do
		sh 'git add -A'
		sh 'git commit -m"Build"' do |ok, res|
		end
		sh 'git push'
	end

	desc 'Generates the static files'
	task :jekyll => [:github] do
		sh 'jekyll build'
	end

	desc 'Moves to the heroku folder'
	task :deploy => [:jekyll] do
		sh 'cp config.ru ../heroku'
		chdir '../heroku'
		sh 'git pull heroku master' do |ok, res|
		end
		sh 'git add -A'
		sh 'git commit -m"Deploying the last build"'
		sh 'git push heroku master'
	end

end

namespace :generate do

	desc 'Generates a post with links for the past week'
	task :twitter do
		add_post_with_tweets
	end

	class Item
		attr_reader :text, :description
		def initialize(args={})
			@text = args[:txt]
			@description = args[:description]
		end
	end

	def last_tweet_printed
		tweet_id = "379569867219017727"
		if File.exists? "./last_tweet_printed.ini"
			File.open("./last_tweet_printed.ini",  "r") do |file|
				tweet_id = file.read
			end
		end
		tweet_id
	end

	def save_last_tweet_printed(tweets)
		tweet_id = tweets.first.id
		File.open("./last_tweet_printed.ini",  "w+") do |file|
			file.write(tweet_id)
		end
	end

	def page_description(url)
		begin
			page = Nokogiri::HTML(open(url.to_s))
			page.css("meta[name=description]")[0].attributes["content"].value
		rescue
			nil
		end
	end

	def fix_links(tweets)
		url_pattern = /(http:\/\/[\.\/a-z0-9A-Z\-\_]*)/
		tweets.map do |t|
			description = page_description(t.text.match(url_pattern))
			t.text.sub(url_pattern, '<a href="\1">\1</a>')
			Item.new({:txt => t.text, :description => description})
		end
	end

	def generate_post(tweets)
		@year = Time.now.year
		@month = Time.now.strftime "%B"
		@day = Time.now.day
		@items = fix_links(tweets)
		file_label = Time.now.strftime '%F'
		renderer = ERB.new(IO.readlines("./tweets_tpl.erb").join())
		output = renderer.result()
		File.open("./_posts/#{file_label}-links.textile",  "w+") do |file|
			file.write(output)
		end
	end

	def add_post_with_tweets
		tweet_id = last_tweet_printed
		client = Twitter::Client.new TweetConfig.config
		tweets = client.search "from:theprogrammer", :since_id => tweet_id
		generate_post tweets.statuses
		save_last_tweet_printed tweets.statuses
	end
end
