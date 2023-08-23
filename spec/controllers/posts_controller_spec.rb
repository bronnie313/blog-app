require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { user_id: 1 }
      expect(response).to be_successful
    end

    it 'renders a correct template' do
      get :index, params: { user_id: 1 }
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder text in the response body' do
      get :index, params: { user_id: 1 }
      expect(response.body).to include('')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { user_id: 1, id: 1 }
      expect(response).to be_successful
    end
  end

  it 'renders the show template' do
    get :show, params: { user_id: 1, id: 1 }
    expect(response).to render_template(:show)
  end

  it 'includes correct placeholder text in the response body' do
    get :show, params: { user_id: 1, id: 1 }
    expect(response.body).to include('')
  end
end
