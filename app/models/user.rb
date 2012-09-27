class User < ActiveRecord::Base
  attr_accessible :bio, :email, :name
  has_many :tweets

  #remember to add actionmailer
  def sendMail
  end

  

end
