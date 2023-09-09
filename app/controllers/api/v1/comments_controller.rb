class Api::V1::CommentsController < ApplicationController
    before_action :set_user_and_post
  load_and_authorize_resource
    def index
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])
        comments = post.comments
        if comments.present?
          render json: { success: true, message: 'Comments retrieved successfully', posts: comments }
        else
          render json: { success: false, message: 'No comments found for the user', status: :not_found }
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User, post, or comments not found' }, status: :not_found
      end
end
