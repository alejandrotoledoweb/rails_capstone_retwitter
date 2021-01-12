require 'rails_helper'
require 'capybara/rspec'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe 'the signin process', type: :feature do
  let(:user) do
    user = User.new
    user.id = '14'
    user.username = 'User1'
    user.email = 'user@email.com'
    user.fullname = 'fullname1'
    user.password = '111111'
    user.password_confirmation = '111111'
  end

  it 'signs @user in' do
    visit '/sessions/new'
    fill_in 'Username', with: 'User1'
    fill_in 'Password', with: '111111'
    click_button 'Log in'
    expect(current_path).to eq(root_path)
  end
end
