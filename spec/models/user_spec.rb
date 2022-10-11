require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(username 'test')
  end

  it 'is valid and added to users' do
    expect(User.all).to include @user
    expect(@user).to be_valid
  end

  it 'useraname should be correct' do
    expect(@user.username).to eql 'test'
  end
  it 'is not valid without a username' do
    user = User.create()
    expect(user).to_not be_valid
  end
  it 'username must be unique' do 
    user = User.create('test')
    expect(User.all).to_not include user
  end
end
