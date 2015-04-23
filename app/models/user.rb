class User < ActiveRecord::Base

  has_many :my_photos, :class_name => "Photo"

  has_many :likes
  has_many :like_photos, :through => :likes, :source => "photo"

  has_many :subscriptions
  has_many :subscribed_photos, :through => :subscriptions, :source => "photo"

end
