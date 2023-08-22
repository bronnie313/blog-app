require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { user.posts.create(title: 'Test Post') }

  it 'should be valid with valid associations' do
    comment = post.comments.new(author: user, text: 'Test Comment')
    expect(comment).to be_valid
  end

  it 'should not be valid without an author' do
    comment = post.comments.new(text: 'Test Comment')
    expect(comment).to_not be_valid
  end

  it 'should not be valid without a post' do
    comment = user.comments.new(text: 'Test Comment')
    expect(comment).to_not be_valid
  end

  it 'should update the post comments counter correctly' do
    comment = post.comments.create(author: user, text: 'Test Comment')
    comment.update_post_comments_counter

    expect(post.reload.comments_counter).to eq(1)
  end
end
