class HomeController < ApplicationController

	#index page
	def index
	end

	def writetweet
		Twitter.update(params[:update])
		render :nothing=>true
	end

end
