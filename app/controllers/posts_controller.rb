class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.user = current_user
    
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
end
