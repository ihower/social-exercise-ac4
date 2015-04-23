class User < ActiveRecord::Base

  has_many :my_photos, :class_name => "Photo"

  has_many :likes
  has_many :like_photos, :through => :likes, :source => "photo"


end
