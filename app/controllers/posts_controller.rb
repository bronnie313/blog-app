class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def add_post
    @user = User.find(params[:user_id])
    @post = Post.new
    render partial: 'forms/addpost', locals: { user: @user, post: @post }
  end

  def new
    @post = Post.new
  end

  def create
    @values = params[:post]
    @post = Post.new(title: @values['title'], text: @values['text'], author: current_user)

    if @post.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy
      redirect_to user_posts_path(current_user, @post), notice: 'Post was successfully deleted'
    else
      p @post.errors.full_messages
    end
  end
end
