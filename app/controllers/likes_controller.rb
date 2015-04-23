class LikesController < ApplicationController

  def create
    photo = Photo.find( params[:photo_id] )
    Like.create( :user => current_user, :photo => photo)

    redirect_to :back
  end

  def destroy
    like = current_user.likes.find( params[:id] )
    like.destroy

    redirect_to :back
  end

end
