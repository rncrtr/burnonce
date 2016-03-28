class User < ActiveRecord::Base

  has_many :emails
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
