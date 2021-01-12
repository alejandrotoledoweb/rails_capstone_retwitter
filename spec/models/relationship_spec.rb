require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it 'is test to create a following' do
    user = User.new
    user1 = User.new
    follow = Relationship.new(follower_id: user.id, followed_id: user1.id)
    expect(follow).to_not be_valid
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
