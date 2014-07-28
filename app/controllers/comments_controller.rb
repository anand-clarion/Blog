class CommentsController < ApplicationController
  def index
  end

  def new
  end

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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to posts_url
    else
      render :text => " hey something gonna wrong"
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
