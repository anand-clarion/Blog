class PostsController < ApplicationController
  # This action show all post and create a new post class instance.
  def index
    @posts = Post.all
    @post = Post.new
  end

  # This action add a new record in posts table.
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to posts_url
    else
     render "new"
    end
  end

  # This action show a post information
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    exit
  end

  # This action delete a record from posts table
  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to posts_url
  end

  # This action permit accessible attributes
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id, :bootsy_image_gallery_id)
  end

end
