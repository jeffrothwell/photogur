class CommentsController < ApplicationController
  before_action :ensure_logged_in
  before_action :find_comment, except: :create
  before_action :ensure_owner, except: :create

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new
    @comment.message = params[:comment][:message]
    @comment.user = current_user

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
    @comment.message = params[:comment][:message]

    if @comment.save
      flash[:notice] = "Thanks for the comment"
      redirect_to picture_path(@comment.picture)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to picture_path(@comment.picture)
  end

  private

  def ensure_owner
    if session[:user_id] != @comment.user_id
      flash[:alert] = "You didn't write that comment"
      redirect_to picture_path(@comment.picture)
    end
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
