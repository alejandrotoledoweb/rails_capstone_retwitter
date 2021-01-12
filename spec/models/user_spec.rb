require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new

  it 'is valid when the values are present' do
    user.username = 'User1'
    user.email = 'user@email.com'
    user.fullname = 'fullname1'
    user.password = '111111'
    user.password_confirmation = '111111'
    expect(user).to be_valid
  end

  it 'is valid when name is present' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'checks email uniquness' do
    user2 = User.create(fullname: 'Juan andres', email: 'alex@email.com', username: 'secretpass',
                        password: '111111', password_confirmation: '111111')
    expect(user2.valid?).to eql(true)

    user2 = User.create(fullname: 'joha', email: 'alex@email.com', username: 'secretpass',
                        password: '111111', password_confirmation: '111111')
    expect(user2.valid?).to eql(false)
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:messages) }
    it { should have_many(:active_relationships) }
    it { should have_many(:passive_relationships) }
    it { should have_many(:following) }
    it { should have_many(:followers) }
  end
end
