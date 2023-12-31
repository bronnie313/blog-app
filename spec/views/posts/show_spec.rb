require 'rails_helper'

RSpec.describe 'posts/show.html.erb', type: :view do
  before do
    @user = User.create(name: 'Lilly')
    @post = @user.posts.create(title: 'Post Title', text: 'Post Body')
    @comment1 = @post.comments.create(author: @user, text: 'Comment 1')
    @comment2 = @post.comments.create(author: @user, text: 'Comment 2')
    @post.likes.create
    @post.likes.create
    assign(:comments, [@comment1, @comment2])
  end

  it 'displays the post title' do
    render
    expect(rendered).to have_content(@post.title)
  end

  it 'displays who wrote the post' do
    render
    expect(rendered).to have_content(@user.name)
  end

  it 'displays how many comments the post has' do
    render
    expect(rendered).to have_content(@post.comments.count)
  end

  it 'displays how many likes the post has' do
    render
    expect(rendered).to have_content(@post.likes.count)
  end

  it 'displays the post body' do
    render
    expect(rendered).to have_content(@post.text)
  end
  it 'displays the username of each commentor' do
    render
    expect(rendered).to have_content(@user.name, count: 3)
  end
  it 'displays the comment each commentor left' do
    render
    expect(rendered).to have_content(@comment1.text)
    expect(rendered).to have_content(@comment2.text)
  end
end
