class UsersController < ApplicationController

	def index
		@all_users = User.all

	end

	def view_user(id)
		@user = User.where("id = ?",id)
	end

end
