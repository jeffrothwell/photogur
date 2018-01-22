class PicturesController < ApplicationController
  before_action :find_picture, only: [:show, :edit, :update, :destroy]
  before_action :ensure_logged_in, except: [
    :index, :previous_work, :pictures_by_year, :show
  ]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.recent
  end

  def previous_work
    @pictures = Picture.older
  end

  def pictures_by_year
    @pictures = Picture.pictures_by_year(params[:year].to_i)
  end

  def show
    @comments = @picture.comments
    @comment = Comment.new
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    @picture.user_id = current_user.id


    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def edit
    # @picture = Picture.find(params[:id])
  end

  def update
    # @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    # @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end

  private

  def find_picture
    @picture = Picture.find(params[:id])
  end

  def ensure_owner
    if session[:user_id] != @picture.user_id
      flash[:alert] = "You don't own that picture"
      redirect_to root_path
    end
  end
end
