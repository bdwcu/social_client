class Tweet < ActiveRecord::Base
  attr_accessible :tweet, :user
  belongs_to :user

  
end
