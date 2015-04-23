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

  def subscribe
    @photo = Photo.find( params[:id] )

    existing_subscription = @photo.find_subscription_by_user(current_user)
    unless existing_subscription
      @subscription = Subscription.create( :user => current_user, :photo => @photo)
    end

    redirect_to :back
  end

  def unsubscribe
    @photo = Photo.find( params[:id] )
    existing_subscription = @photo.find_subscription_by_user(current_user)

    existing_subscription.destroy
    redirect_to :back
  end

  protected

  def photo_params
    params.require(:photo).permit(:title, :image)
  end

end
