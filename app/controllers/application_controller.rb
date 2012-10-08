
class ApplicationController < ActionController::Base
  protect_from_forgery


    #Twitter consumer key and secret
  twitter_key = "6xoFQDY4F2BBZ2ivDmd17Q"
  twitter_secret = "lINK86KMTB4Fzq2B6QqMr4MZs88mTQiFKcEIxj0UNmE"
 
  #configure twitter client
  #configure twitter client
  Twitter.configure do |config|
    config.consumer_key = "6xoFQDY4F2BBZ2ivDmd17Q"
    config.consumer_secret = "lINK86KMTB4Fzq2B6QqMr4MZs88mTQiFKcEIxj0UNmE"
    #config.oauth_token = "19368648-D0mY1H1CCYa8Axxv6K1oRtHnKKYFGVxGEpRumZzE0"
    #config.oauth_token_secret = "ESBjPTIj5GxVRkZvsIOPoExP2aGeSZbue6ekzgcDA"
  end

  

  #OmniAuth
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    provider :twitter, twitter_key,twitter_secret
  end

  #configure Instagram
  Instagram.configure do |config|
  	config.client_id = "473382b1837a423392987da1d84baeb1"
  	config.client_secret = "e92a898ed65a470fbd9d330c724c0cee"
  end




end
