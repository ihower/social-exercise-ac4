class Like < ActiveRecord::Base

  belongs_to :photo, :counter_cache => true
  belongs_to :user

end
