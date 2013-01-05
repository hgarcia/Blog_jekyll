#git add -A
#git commit -m"Build"
#git push

#jekyll

#cd ../heroku
#git add -A
#git commit -m"Deploying the last build"
#git push heroku master

require 'rubygems'
require 'git'


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
		sh 'jekyll'
	end

	desc 'Moves to the heroku folder'
	task :deploy => [:jekyll] do
		sh 'cp config.ru ../heroku'
		chdir '../heroku'
		sh 'git pull' do |ok, res|
		end
		sh 'git add -A'
		sh 'git commit -m"Deploying the last build"'
		sh 'git push heroku master'
	end

end
