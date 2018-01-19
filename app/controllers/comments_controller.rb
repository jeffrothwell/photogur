class CommentsController < ApplicationController

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @product.reviews.new
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
