class CommentsController < ApplicationController
  
  def add_comment
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    render partial: 'forms/comment', locals: { user: @user, post: @post, comment: @comment }
  end

  def new
    @comment = Comment.new
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = @user

    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment was successfully added.'

    else
      render partial: 'forms/comment', locals: { user: @user, post: @post, comment: @comment }
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.find(params[:id])
    if @comment.destroy
      redirect_to user_post_path(current_user, @post), notice: 'Comment was successfully deleted'
    else
      p @comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
