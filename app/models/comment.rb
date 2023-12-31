class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post, class_name: 'Post', foreign_key: :post_id, optional: true

  def update_post_comments_counter
    post.update_comments_counter
  end
end
