class Photo < ActiveRecord::Base

  belongs_to :creator, :class_name => "Creator", :foreign_key => "user_id"

  has_many :comments

  has_many :likes
  has_many :like_users, :through => :likes, :source => "user"

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => "user"

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def find_like_by_user(user)
    user && self.likes.where( :user_id => user.id ).first
  end

  def find_subscription_by_user(user)
    user && self.subscriptions.where( :user_id => user.id ).first
  end

end
