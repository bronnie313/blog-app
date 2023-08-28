class LikesController < ApplicationController
  def like
    @post = Post.find(params[:id])
    @post.likes.create(author: current_user)
    redirect_to user_post_path(@post.author, @post), notice: 'Post liked!'
  end
end
