class PhotosController < ApplicationController

  before_action :require_login, :only => [:new]

  def new
  end

end
