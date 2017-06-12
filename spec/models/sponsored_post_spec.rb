require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:sponsored_post) { SponsoredPost.create!(title: "New Sponsored Post Title", body: "New Sponsored Post Body", price: 2) }

   describe "attributes" do
     it "has title, body and price attributes" do
       expect(sponsored_post).to have_attributes(title: "New Sponsored Post Title", body: "New Sponsored Post Body", price: 2)
     end
   end
end
