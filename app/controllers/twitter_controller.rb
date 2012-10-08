class TwitterController < ApplicationController
	layout 'twitter'

	#home page for twitter client
	def index
		
		Twitter.update("super duper");
	end

	

	def auth_hash
		request.env["omniauth.auth"]
		render :nothing=>true
	end

	# This is the callback from the Omniauth
	# Note: probably should, but can't make this a protected method?
	def init
		# Goal = need to pull out some data from OmniAuth
		url = URI.parse("https://api.twitter.com/oauth/access_token")
		auth = request.env["omniauth.auth"]
		
		token = request.env["omniauth.auth"]["credentials"].token
		secret = request.env["omniauth.auth"]["credentials"].secret

	

		Twitter.configure do |config|
    		config.consumer_key = "6xoFQDY4F2BBZ2ivDmd17Q"
    		config.consumer_secret = "lINK86KMTB4Fzq2B6QqMr4MZs88mTQiFKcEIxj0UNmE"
    		config.oauth_token = token
    		config.oauth_token_secret = secret
  		end

  		

	  	redirect_to :action=>"index"


	end

end
