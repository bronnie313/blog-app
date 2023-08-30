require 'rails_helper'

RSpec.describe 'users/show.html.erb', type: :view do
  before do
    @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
    @post1 = @user.posts.create(title: 'Post 1', text: 'Hello from Tom')
    @post2 = @user.posts.create(title: 'Post 2', text: 'Greetings from Lilly')
    @post3 = @user.posts.create(title: 'Post 3', text: 'Hi George')
  end

  scenario 'displays the user profile picture' do
    render
    expect(rendered).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
  end

  scenario 'display the users username' do
    render
    expect(rendered).to have_content(@user.name)
  end

  scenario 'display the number of posts a user has posted' do
    render
    expect(rendered).to have_content(@user.posts.count)
  end

  scenario 'displays the user bio' do
    render
    expect(rendered).to have_content(@user.bio)
  end

  scenario 'displays the first 3 posts of the user' do
    render
    expect(rendered).to have_content(@post1.title)
    expect(rendered).to have_content(@post2.title)
    expect(rendered).to have_content(@post3.title)
  end

  scenario 'displays a button to view all of a user\'s posts' do
    render
    expect(rendered).to have_link('see all posts', href: user_posts_path(@user))
  end
end
