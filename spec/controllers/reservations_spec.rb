require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
  before :all do
    @username = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @eventname = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @user = User.create(username: @username)
    @event = Event.create(name: @eventname, event_date: '2022-12-12', photo: 'test', location: 'constantine',
                          ticket_price: 200, seats_available: 230, user_id: @user.id)
  end

  describe 'Index action' do
    it 'returns the users reservations' do
      get :index, params: { user_id: @user.id }
      expect(response.status).to eq(200)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_empty
    end
  end

  describe 'Create reservation action' do
    it 'returns status 200' do
      post :create, params: { reservation_date: '2020-12-12', user_id: @user.id, event_id: @event.id }
      expect(response.status).to eq(200)
    end
  end
end
