require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Add", body: "New Add Body", price: 2) }

  describe "attributes" do
     it "has title, body and price attributes" do
       expect(advertisement).to have_attributes(title: "New Add", body: "New Add Body", price: 2)
     end
   end
end
