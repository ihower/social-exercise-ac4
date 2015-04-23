class Comment < ActiveRecord::Base

  validates_presence_of :content

  belongs_to :photo
  belongs_to :user

  def notify!
    self.photo.subscribed_users.each do |user|
      UserMailer.notify_comment(user, self).deliver_later!
    end
  end

end
