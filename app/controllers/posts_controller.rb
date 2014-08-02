class PostsController < ApplicationController
  
  # This action show all post and create a new post class instance.
  def index 
    if current_user.admin?
      @posts = Post.all.order(created_at: :desc)
    else
      @posts = Post.where(is_active: 1).order(created_at: :desc)
    end
  end

  # This action create a new instance of post class
  def new
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
    if current_user.admin?
      @comments = @post.comments
    else
      @comments = @post.comments.where(is_active: 1)
    end
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
    params.require(:post).permit(:title, :content, :user_id, :category_id)
  end

end
