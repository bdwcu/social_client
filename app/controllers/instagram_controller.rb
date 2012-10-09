class InstagramController < ApplicationController
	#set up the redirect URI
	redirectURL = "http://localhost:3000/instagram/"

	def index
		if(session[:instagramloggedin] != true)
			redirect_to :action=>"auth"
		end

	end


	def auth
		
		redirect_to Instagram.authorize_url(:redirect_uri => redirectURL)
	end

	def finishAuth
		response = Instagram.get_access_token(params[:code],:redirect_uri=>redirectURL)
		session[:instagram_token] = response.access_token

		redirect_to :action=>"index"
	end
end
