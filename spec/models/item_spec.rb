require 'rails_helper'

RSpec.describe Item, type: :model do
    
   let(:user) { create(:user) }
   let(:item) { Item.create!(name: 'item name', user: user) }
 
   describe "attributes" do
     it "should respond to name" do
       expect(item).to respond_to(:name)
     end
   end
   
end
