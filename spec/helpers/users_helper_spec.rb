require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  it 'valid when it has a gravatar' do
    user = User.new
    user.email = 'alext@email.com'
    g = helper.gravatar_for(user)
    expect(g).to eql('<img class=\"gravatar\" src=\"https://secure.gravatar.com/avatar/b43f643e521679f7fb249c071e0900eb\" />')
  end
end
