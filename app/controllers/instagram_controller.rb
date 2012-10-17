class InstagramController < ApplicationController
	

	def index
		if(session[:instagram_token] == "")
			redirect_to :action=>"auth"
		end
	end

	def getFeed
		client = Instagram.client(:access_token => session[:instagram_token])
		user = client.user

		media = client.user_recent_media

		respond_to do |format|
			format.html
			format.json {render :json=>media}
		end
	end
	def auth
		#set up the redirect URI
		@redirectURL = Social::Application::INSTAGRAM_ENDPOINT

		redirect_to Instagram.authorize_url(:redirect_uri => @redirectURL)
	end

	#this is actually /instagram/check
	def finishAuth
		#set up the redirect URI
		@redirectURL = Social::Application::INSTAGRAM_ENDPOINT
		@response = Instagram.get_access_token(params[:code],:redirect_uri=>@redirectURL)
		
		session[:instagram_token] = @response.access_token
		

		redirect_to :action=>"index"
	end
end
