require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { create(:user) }
   
    describe "attributes" do

     it "should respond to name" do
       expect(user).to respond_to(:name)
     end

     it "should respond to email" do
       expect(user).to respond_to(:email)
     end
   end
   
   describe ".avatar_url" do

     let(:known_user) { create(:user, email: "blochead@bloc.io") }
 
     it "returns the proper Gravatar url for a known email entity" do

       expected_gravatar = "http://gravatar.com/avatar/bb6d1172212c180cfbdb7039129d7b03.png?s=48"

       expect(known_user.avatar_url(48)).to eq(expected_gravatar)
     end
   end   
end
