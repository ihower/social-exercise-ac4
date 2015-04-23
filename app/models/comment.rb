class Comment < ActiveRecord::Base

  validates_presence_of :content

  belongs_to :photo
  belongs_to :user

end
