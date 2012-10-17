
class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name
  has_many :tweets

  #remember to add actionmailer
  def sendMail
  end


  protected
  # This inits a user. One of two things will happen
  # 1. A new user will be created
  # 2. User will be found in database and tweets get loaded.
  # 
  # Pass in a "Twitter" object for the user
  def initUser()
 	
  end

 

end
