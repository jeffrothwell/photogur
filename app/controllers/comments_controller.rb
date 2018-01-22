class CommentsController < ApplicationController
  before_action :ensure_logged_in
  before_action :ensure_owner, except: :create

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new
    @comment.message = params[:comment][:message]

    if @comment.save
      flash[:notice] = "Thanks for the comment"
      redirect_to picture_path(@picture)
    else
      render picture_path(@picture)
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
