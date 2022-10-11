require 'json'
require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  before :each do
    @imran = User.create(username: 'Imran')
    @bilal = User.create(username: 'Bilal')
    @amadou = User.create(username: 'Amadou')
    get :index
  end

  describe 'Index action' do
    it 'returns all the users' do
      expect(response.status).to eq(200)
      expect(response.body).to include 'Imran', 'Bilal', 'Amadou'
      expect(User.all).to include @imran, @bilal, @amadou
    end
    it 'returns the exact user by id' do
      get :show, params: { id: @bilal.id }
      expect(response.status).to eq(200)
      expect(response.body).to include 'Bilal'
      user = JSON.parse(response.body)
      expect(user).to eql @bilal.as_json
    end
    it 'returns the right models' do
      users = JSON.parse(response.body)
      expect(users).to include @imran.as_json, @bilal.as_json, @amadou.as_json
    end
    it 'deletes the user' do
      delete :destroy, params: { id: @amadou.id }
      expect(response.body).to include "User #{@amadou.username}  was deleted"
      expect(User.all).to_not include @amadou
    end
  end
end
