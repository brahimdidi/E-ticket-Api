require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is not valid without a name' do
    event = Event.new(name: nil)
    expect(event).to_not be_valid
  end

  it 'is not valid without a photo' do
    event = Event.new(photo: nil)
    expect(event).to_not be_valid
  end

  it 'is not valid without a location' do
    event = Event.new(location: nil)
    expect(event).to_not be_valid
  end

  it 'is not valid without an event date' do
    event = Event.new(event_date: nil)
    expect(event).to_not be_valid
  end

  it 'is not valid without a ticket price' do
    event = Event.new(ticket_price: nil)
    expect(event).to_not be_valid
  end
end
