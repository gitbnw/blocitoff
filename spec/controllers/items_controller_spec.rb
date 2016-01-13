require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
   let(:my_user) { create(:confirmed_user) }
   
   
   let(:my_item) { Item.create!(name: 'item name', user: my_user) }

    
   describe "GET new" do
    context 'when user is logged in' do
      before do
        sign_in my_user
        get :new, user_id: my_user.id
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :new }

 
     it "initializes @item" do
       get :new, user_id: my_user.id
       expect(assigns(:item)).not_to be_nil
     end
   end
 end
   

  describe "DELETE destroy" do
    context 'when user is logged in' do
      before do
        sign_in my_user
        get :new, user_id: my_user.id
      end         
       it "deletes the item" do

         delete :destroy, format: :js, user_id: my_user.id, id: my_item.id
         count = Item.where({id: my_item.id}).count
         expect(count).to eq 0
       end
     end
 end
 
  describe "PUT complete" do
    context 'when user is logged in' do
      before do
        sign_in my_user
        get :new, user_id: my_user.id
      end         
       it "updates the item status to complete" do
       new_status = 1
       
         put :complete, user_id: my_user.id, item_id: my_item.id, item: {name: my_item.name, status: new_status}
         completed_item = assigns(:item)
         expect(completed_item.id).to eq my_item.id
         expect(completed_item.name).to eq my_item.name
         expect(completed_item.status).to eq "complete"
       end
     end
 end 
 
end
   

