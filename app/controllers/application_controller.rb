
class ApplicationController < ActionController::Base
  protect_from_forgery


 
  #configure Instagram
  Instagram.configure do |config|
  	config.client_id = "473382b1837a423392987da1d84baeb1"
  	config.client_secret = "e92a898ed65a470fbd9d330c724c0cee"
  end




end
