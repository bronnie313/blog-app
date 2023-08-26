class CommentsController < ApplicationController
    def new
        @post = Post.fine(params[:post_id])
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(params.require(:comment).permit(:text))
        @comment.user = current_user

        if @comment.save
            redirect_to posts_path(@post)
        else
            render :new
        end
    end
end