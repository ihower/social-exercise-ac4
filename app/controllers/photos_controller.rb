class PhotosController < ApplicationController

  before_action :require_login, :only => [:new]

  def index
    @photos = Photo.page(params[:page])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new( photo_params )
    @photo.user = current_user

    if @photo.save
      redirect_to root_url
    else
      render :action => :new
    end
  end

  protected

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

end
