class SessionsController < ApplicationController

  def create
    #Rails.logger.debug("------fb data------")
    #Rails.logger.debug( auth_hash.inspect )
    #Rails.logger.debug("===")
    #Rails.logger.debug( auth_hash[:uid] )
    #Rails.logger.debug( auth_hash[:info][:name] )
    #Rails.logger.debug( auth_hash[:info][:email] )
    #Rails.logger.debug( auth_hash[:info][:image] )

    #Rails.logger.debug( auth_hash[:credentials][:token] )
    #Rails.logger.debug( auth_hash[:credentials][:expires_at] )

    user = User.where( :fb_uid => auth_hash[:uid] ).first

    unless user
      user = User.new( :name => auth_hash[:info][:name],
                       :email => auth_hash[:info][:email],
                       :fb_image => auth_hash[:info][:image],
                       :fb_token => auth_hash[:credentials][:token],
                       :fb_expires_at => auth_hash[:credentials][:expires_at] )

      user.save!
    end

    session[:user_id] = user.id

    redirect_to root_path
  end

  def destroy
    reset_session

    redirect_to root_path
  end

  protected


  def auth_hash
    request.env['omniauth.auth']
  end

end
