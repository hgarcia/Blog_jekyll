require 'rubygems'
require 'git'

require File.dirname(__FILE__) + '/tweet_config.rb'

task :default => 'build:deploy'

namespace :build do

  desc 'Pre building the site for local testing'
	task :pre => [:merge_and_minimize_css] do
		sh 'jekyll build'
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
		sh 'git pull --rebase' do |ok, res|
		end
		sh 'git push'
	end

	desc 'Generates the static files'
	task :jekyll => [:github] do
		chdir '../heroku'
		sh 'git pull heroku master' do |ok, res|
		end
		chdir '../Blog'
		sh 'jekyll build'
	end

	desc 'Moves to the heroku folder'
	task :deploy => [:jekyll] do
		sh 'cp config.ru ../heroku'
		sh 'cp Procfile ../heroku'
		sh 'cp Gemfile ../heroku'
    sh 'cp robots.txt. ../heroku'
		chdir '../heroku'
		sh 'git pull heroku master' do |ok, res|
		end
		sh 'bundle install'
		sh 'git add -A'
		sh 'git commit -m"Deploying the last build"'
		sh 'git push heroku master'
	end

end
