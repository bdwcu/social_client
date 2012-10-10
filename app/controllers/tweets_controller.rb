class TweetsController < ApplicationController

	def init
		token = request.env["omniauth.auth"]["credentials"].token
		secret = request.env["omniauth.auth"]["credentials"].secret
		
		Twitter.configure do |config|
		  config.consumer_key = "oFNOUiTIdGRVxWlvxEscGA"
		  config.consumer_secret = "ZAefGBoflsvB1cBqCZvefG2jBHyEuHZr2SKszpU"
		  config.oauth_token = token
		  config.oauth_token_secret = secret
		end

		session[:loggedin] = loggedin


		redirect_to "localhost:3000/tweets/timeline"
	end

	def index
	end
	
	def timeline 
		@timeline = Twitter.home_timeline
	end

	def my_tweets 
		@my_tweets = Twitter.user_timeline
	end

	def mentions 
		@mentions = Twitter.mentions
	end

	def favorites 
		@favorites = Twitter.favorites
	end

	def update 
		if params[:tweet]
			Twitter.update(params[:tweet])
		end
	end

end
