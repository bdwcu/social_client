class HomeController < ApplicationController

	before_filter :checkLogin

	#index page
	def index
	
	end

	def writetweet
		Twitter.update(params[:update])
		render :nothing=>true
	end



	def checkLogin
		if session[:twitterloggedin]
			@twitterloggedin = true
		end

		if session[:instagramloggedin]
			@instagramloggedin = true;
		end
	end

end
