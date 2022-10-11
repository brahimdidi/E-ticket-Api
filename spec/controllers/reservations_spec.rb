require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :controller do
    before :all do
      @user = User.create(username: 'ikram')
      @event = Event.create(name: 'music event', event_date: '2022-12-12', photo: 'test', location: 'constantine', ticket_price: 200 ,seats_available: 230, user_id: @user.id)
    end

    describe 'GET index' do
        it 'returns the users reservations' do
          get :index, params: { user_id: @user.id }
          expect(response.status).to eq(200)
          parsed_response = JSON.parse(response.body)
          expect(parsed_response).not_to be_empty
        end
      end
end  