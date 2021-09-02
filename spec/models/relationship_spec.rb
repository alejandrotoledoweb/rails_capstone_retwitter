require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it 'is test to create a following' do
    user = User.new
    user.id = '14'
    user.username = 'User1'
    user.email = 'user@email.com'
    user.fullname = 'fullname1'
    user.password = '111111'
    user.password_confirmation = '111111'
    user1 = User.new
    user1.id = '15'
    user1.username = 'User2'
    user1.email = 'user2@email.com'
    user1.fullname = 'fullname2'
    user1.password = 'foobar'
    user1.password_confirmation = 'foobar'
    follow = Relationship.new
    follow.follower = user
    follow.followed = user1
    expect(follow).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followed_id) }
  end

  describe 'associations' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end
end
