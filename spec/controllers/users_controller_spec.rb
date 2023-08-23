require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successive response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders a correct template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder text in the response body' do
      get :index
      expect(response.body).to include('')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end
  end

  it 'renders the show template' do
    get :show, params: { id: 1 }
    expect(response).to render_template(:show)
  end

  it 'includes correct placeholder text in the response body' do
    get :show, params: { id: 1 }
    expect(response.body).to include('')
  end
end
