class TwitterController < ApplicationController
	layout 'twitter'

	before_filter :checkAuth, :except => :init
	respond_to :html , :json

	#home page for twitter client
	def index
		
		@tweets = Twitter.user_timeline()
		respond_with @tweets 

		
	end

	

	#api call to get tweets
	def getTimeline
	#get timeline of tweets
			@tweets = Twitter.user_timeline()
			respond_to do |format|
				format.json {render :json=>@tweets}
			end
	end
	

	def auth_hash
		request.env["omniauth.auth"]
		render :nothing=>true
	end

	# This is the callback from the Omniauth
	# Note: probably should, but can't make this a protected method?
	def init
		
		
		auth = request.env["omniauth.auth"]
		token = request.env["omniauth.auth"]["credentials"].token
		secret = request.env["omniauth.auth"]["credentials"].secret

	
		#configure twitter client
		Twitter.configure do |config|
    		config.consumer_key = "6xoFQDY4F2BBZ2ivDmd17Q"
    		config.consumer_secret = "lINK86KMTB4Fzq2B6QqMr4MZs88mTQiFKcEIxj0UNmE"
    		config.oauth_token = token
    		config.oauth_token_secret = secret
  		end

  		#session stating a user is logged in
  		session[:twitterloggedin] = true

  		#store token and secret securely somehow? May not be needed

	  	redirect_to :action=>"index"


	end

	protected
	def checkAuth
		redirect_to "/auth/twitter" unless session[:twitterloggedin]
	end

end
