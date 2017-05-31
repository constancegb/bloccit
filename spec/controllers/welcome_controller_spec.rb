require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET index" do
     it "renders the index template" do
       get :index #call the index method of WelcomeController
       expect(response).to render_template("index") # expect the controller's response to render the index template
     end
   end
   
   describe "GET about" do
     it "renders the about template" do
       get :about
       expect(response).to render_template("about")
     end
   end

end
