require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    @username = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @eventname = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @user = User.create(username: @username, email: 'tes@gmail.com', password_digest: '123344')
    @event = Event.create(name: @eventname, event_date: '2022-12-12', photo: 'test', location: 'constantine',
                          ticket_price: 200, seats_available: 230, user_id: @user.id)
    @reservation = Reservation.new(reservation_date: '2022-09-04', user_id: @user.id, event_id: @event.id)
  end

  it 'is valid' do
    expect(@reservation).to be_valid
  end

  it 'Date should be present' do
    @reservation.reservation_date = '2022-09-04'
    expect(@reservation).to be_valid
  end
end
