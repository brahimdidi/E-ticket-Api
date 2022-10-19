require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @username = (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @user = User.create(username: @username, email: 'tes@gmail.com', password_digest: '123344')
  end

  it 'is valid and added to users' do
    expect(User.all).to include @user
    expect(@user).to be_valid
  end

  it 'useraname should be correct' do
    expect(@user.username).to eql @username
  end
  it 'is not valid without a username' do
    user = User.create
    expect(user).to_not be_valid
  end
end
