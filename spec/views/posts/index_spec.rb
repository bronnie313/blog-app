require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
    before do
        @user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
        @post1 = @user.posts.create(title: 'Post 1', text: 'Hello from Tom')
        @post2 = @user.posts.create(title: 'Post 2', text: 'Greetings from Lilly')
        @post3 = @user.posts.create(title: 'Post 3', text: 'Hi George')
        @post1.comments.create(text: "Comment 1")
        @post1.comments.create(text: "Comment 2")
        @post1.likes.create
        @post1.likes.create
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

    scenario "displays a post's title" do
        render
        expect(rendered).to have_content(@post1.title)
      end
    
    #   scenario "displays the first comments on a post" do
    #     render
    #     expect(rendered).to have_content(@post1.comments.first.text)
    #   end

      scenario "displays how many comments a post has" do
        
        render
        expect(rendered).to have_content(@post1.comments.count)
      end
    
      scenario "displays how many likes a post has" do
        
        render
        expect(rendered).to have_content(@post1.likes.count)
      end
end 