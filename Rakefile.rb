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


task :default => 'build:github'


namespace :build do
	
	desc 'Minimizing and combining css files'
	task :merge_and_minimize_css do
		sh 'juicer merge assets/css/master.css --force'
	end
	
	desc 'Add changes commit and push to github'
	task :github => [:merge_and_minimize_css]do
		sh 'git add -A'
		sh 'git commit -m"Build"'
		sh 'git push'		
	end
end
