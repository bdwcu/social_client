class InstagramController < ApplicationController
	

	def index
		if(session[:instagram_token] == "")
			redirect_to :action=>auth
		end
	end


	def auth
		#set up the redirect URI
		@redirectURL = "http://localhost:3000/instagram/check"
		redirect_to Instagram.authorize_url(:redirect_uri => @redirectURL)
	end

	def finishAuth
		#set up the redirect URI
		@redirectURL = "http://localhost:3000/instagram/check"
		@response = Instagram.get_access_token(params[:code],:redirect_uri=>@redirectURL)
		
		session[:instagram_token] = @response.access_token
		

		redirect_to :action=>"index"
	end
end
