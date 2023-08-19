require 'rails_helper'

RSpec.describe User, type: :model do
    it 'name should not be empty' do
        user = User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'User bio')
        user.name = nil
        expect(user).to_not be_valid
    end

    it 'posts_counter should not be less than 0' do
        user = User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'User bio')
        user.post_counter = -1
        expect(user).to_not be_valid
    end
    
    it 'posts_counter should be an integer' do
        user = User.new(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'User bio')
        user.post_counter = 'one'
        expect(user).to_not be_valid
    end

    it 'returns 3 most recent posts' do
        user = User.create(name: 'John Doe')
        post1 = user.posts.create(title: 'Post 1', text: 'Text 1') 
        post2 = user.posts.create(title: 'Post 2', text: 'Text 2')
        post3 = user.posts.create(title: 'Post 3', text: 'Text 3')
        post4 = user.posts.create(title: 'Post 4', text: 'Text 4')
    
        recent_posts = user.recent_posts
    
        expect(recent_posts).to eq([post4, post3, post2])
    end
end
