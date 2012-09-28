
class ApplicationController < ActionController::Base
  protect_from_forgery

  #configure Twitter client
  #note - might have to change redirect urls
  Twitter.configure do |config|
  	config.consumer_key = "sMHWTKi986MxQwZDflvRA"
  	config.consumer_secret = "tO0ua36xeh3ouNrD84WoG3VfJKdXhjjockoUULJV0"
  	config.oauth_token = "19368648-5WcH2zHleZkzERa1xwI0rGq0Ro2kiij3ZaCcUAZmc"
  	config.oauth_token_secret = "yYPpaIMvR8H9zO4ozOrp5EuzCfHRAPCGlSQkYaXGMY"
  end

  #configure Instagram
  Instagram.configure do |config|
  	config.client_id = "473382b1837a423392987da1d84baeb1"
  	config.client_secret = "e92a898ed65a470fbd9d330c724c0cee"
  end




end
