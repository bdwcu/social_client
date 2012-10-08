 #OmniAuth

Rails.application.config.middleware.use OmniAuth::Builder do
   provider :developer unless Rails.env.production?
   provider :twitter, "6xoFQDY4F2BBZ2ivDmd17Q","lINK86KMTB4Fzq2B6QqMr4MZs88mTQiFKcEIxj0UNmE"
 end

OmniAuth.config.logger = Rails.logger