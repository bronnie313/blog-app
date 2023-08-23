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
      expect(response.body).to include("List of Users")
    end
  end
end
