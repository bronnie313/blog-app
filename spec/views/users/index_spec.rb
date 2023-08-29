require 'rails_helper'

RSpec.feature 'User index page' do
    before do
        user1 = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
        user2 = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
        user1.posts.create(title: 'Post 1', text: 'Hello from Tom')
        user2.posts.create(title: 'Post 2', text: 'Greetings from Lilly')
    end

    scenario 'display usernames of all other users' do
        visit '/users' 

        expect(page).to have_content('Tom')
        expect(page).to have_content('Lilly')
    end

    scenario 'display user profile picture for each user' do
        visit '/users'

        expect(page).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
        expect(page).to have_css('img[src*="https://unsplash.com/photos/F_-0BxGuVvo"]')
    end

    scenario 'displaps the no of posts each user has written' do
        visit '/users' 

        expect(page).to have_content('Number of posts: 1')
    end

    scenario 'when clicked on a user should redirect to that user show page' do
        visit '/users'

        click_link 'Tom'
        expect(page).to have_current_path(user_path(User.find_by(name: 'Tom')))
    end 
end 