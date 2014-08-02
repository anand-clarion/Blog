class CommentsController < ApplicationController
  def index
  end

  def new
  end

  # This actoin add a new record in comments table.
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to posts_url
    else
      render :text => "Hey something gonna wrong"
    end
  end

  def edit
  end

  def update
  end

  # This action delete a record from comments table.
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to posts_url
    else
      render :text => " hey something gonna wrong"
    end
  end

  # This action permit accessible attribute for comment model.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
