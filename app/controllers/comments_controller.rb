class CommentsController < ApplicationController
  
  # This action show all comments of a post
  def show
    if current_user.admin?
      @comments = Comment.where(post_id: params[:id]).paginate(:page => params[:page], :per_page => 3)
    else
      @comments = Comment.where(post_id: params[:id]).where(is_active: 1).paginate(:page => params[:page], :per_page => 3)
    end
  end

  # This actoin add a new record in comments table.
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Your comment successfully created and send to admin for moderation"
      UserMailer.comment_create(@comment).deliver
      redirect_to posts_url
    else
      flash[:notice] = "comment can't submit empty"
      redirect_to posts_url
    end
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
