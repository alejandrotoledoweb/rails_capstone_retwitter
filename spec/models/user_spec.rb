require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new

  it 'is valid when the values are present' do
    user.username = 'User1'
    user.email = 'user@email.com'
    user.fullname = 'fullname1'
    expect(user).to be_valid
  end

  it 'is valid when name is present' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'checks email uniquness' do
    user2 = User.create(fullname: 'Juan andres', email: 'alex@email.com', username: 'secretpass')
    user2.valid?
    expect(user2.valid?).to eql(true)

    user2 = User.create(fullname: 'joha', email: 'joha@email.com', username: 'secretpass')
    expect(user2.valid?).to eql(false)
  end

  # describe 'associations' do
  #   subject { User.create(name: 'alex', email: 'alex@gmail.com', password: '123456') }
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:email) }
  #   it { should validate_presence_of(:password) }
  # end
  # describe 'associations' do
  #   it { should have_many(:posts) }
  #   it { should have_many(:comments) }
  #   it { should have_many(:likes) }
  #   it { should have_many(:requested_friendships) }
  #   it { should have_many(:received_friendships) }
  #   it { should have_many(:confirmed_friendships) }
  # end

  # describe '#friends' do
  #   friends_array = nil
  #   it 'show something if there is a friendships' do
  #     expect(friends_array).to be_nil
  #   end
  # end
end
