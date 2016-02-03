class ItemsController < ApplicationController

before_action :authenticate_user!

  def new
    
    @user = User.find(params[:user_id])
    @item = Item.new

  end 
   
 def create
    @item = Item.new
    @item.name = params[:item][:name]
    @user = current_user
    @item.user = @user

     if @item.save
       flash[:notice] = "Item saved successfully."

       redirect_to [@user]
       
     else
       flash[:alert] = "Item failed to save."

      render :new
     end
    
 end
 
 def destroy
 
    @item = Item.find(params[:id])

     if @item.destroy
       flash[:notice] = "Item was deleted."
     else
       flash[:alert] = "Item couldn't be deleted. Try again." 
     end

     respond_to do |format|
       format.html
       format.js
     end
     
 end
 
def status
  @item = Item.find(params[:item_id])
  if @item.status == 1
      @item.status = 0
  else
      @item.status = 1
  end
  @user = current_user

     if @item.save
       flash[:notice] = "Item updated successfully."

     else
       flash[:alert] = "Item failed to save."

     end
     
     respond_to do |format|
       format.html
       format.js
     end
     
end

 
 def update
     
 end
 
 
end
