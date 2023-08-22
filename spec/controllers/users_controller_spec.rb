require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successive response' do
      get :index
      expect(response).to be_successful
    end
  end
end
