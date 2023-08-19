require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe') }

  it 'should be valid with a title' do
    post = user.posts.new(title: 'Test Post')
    expect(post).to be_valid
  end

  it 'should not be valid without a title' do
    post = user.posts.new(title: nil)
    expect(post).to_not be_valid
  end

  it 'should not be valid if title length exceeds 250 characters' do
    post = user.posts.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end

  it 'should update the user post counter correctly' do
    post1 = user.posts.create(title: 'Test Post 1')
    user.posts.create(title: 'Test Post 2')

    post1.update_user_post_counter

    expect(user.reload.post_counter).to eq(2)
  end

  it 'comments_counter should be an integer greater than or equal to zero' do
    post = user.posts.new(title: 'Test Post')

    post.comments_counter = 0
    expect(post).to be_valid

    post.comments_counter = 5
    expect(post).to be_valid

    post.comments_counter = -1
    expect(post).to_not be_valid

    post.comments_counter = 2.5
    expect(post).to_not be_valid

    post.comments_counter = 'invalid'
    expect(post).to_not be_valid
  end

  it 'should return recent comments' do
    post = user.posts.create(title: 'Test Post')
    post.comments.create(author: user, text: 'Comment 1')
    comment2 = post.comments.create(author: user, text: 'Comment 2')
    comment3 = post.comments.create(author: user, text: 'Comment 3')

    recent_comments = post.recent_comments(2)

    expect(recent_comments).to eq([comment3, comment2])
  end
end
