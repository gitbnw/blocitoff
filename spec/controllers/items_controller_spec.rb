require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
   let(:my_user) { create(:user) }
   
   let(:my_item) { Item.create!(name: 'item name', user: my_user) }

    
   describe "GET new" do
     it "returns http success" do
       get :new, user_id: my_user.id
       expect(response).to have_http_status(:success)
     end
 
     it "renders the #new view" do
       get :new, user_id: my_user.id
       expect(response).to render_template :new
     end
 
     it "initializes @item" do
       get :new, user_id: my_user.id
       expect(assigns(:item)).not_to be_nil
     end
   end
   
end
