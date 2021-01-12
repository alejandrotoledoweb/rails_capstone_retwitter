require 'rails_helper'

RSpec.describe Message, type: :model do
  it 'is test to create a message' do
    user = User.new
    message = Message.new(user_id: user.id, body: 'this is a boyd of a message')
    expect(message).to_not be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:body) }
  end

end
