require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:post) { user.posts.create(title: 'Test Post') }

  it 'should be valid with valid associations' do
    like = post.likes.new(author: user)
    expect(like).to be_valid
  end

  it 'should not be valid without an author' do
    like = post.likes.new
    expect(like).to_not be_valid
  end

  it 'should not be valid without a post' do
    like = user.likes.new
    expect(like).to_not be_valid
  end

  it 'should update the post likes counter correctly' do
    like = post.likes.create(author: user)
    like.update_post_likes_counter

    expect(post.reload.likes_counter).to eq(1)
  end
end
