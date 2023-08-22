require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { user_id: 1 }
      expect(response).to be_successful
    end
  end
end
