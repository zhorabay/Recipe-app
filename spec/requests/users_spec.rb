require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index' do
    let(:user) { create(:user) }

    it 'returns a successful response' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get '/'
      expect(response.body).to match('Number of recipes')
    end
  end
end
