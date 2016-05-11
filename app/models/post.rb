class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  extend FriendlyId
  friendly_id :title, use: :slugged
end
