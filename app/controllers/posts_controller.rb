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

  def like
    @post = Post.find(params[:id])
    @post.likes.create(author: current_user)
    redirect_to user_post_path(@post.author, @post), notice: 'Post liked!'
  end
end
