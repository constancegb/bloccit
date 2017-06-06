require 'rails_helper'

RSpec.describe PostsController, type: :controller do #tells RSpec to treat the test as a controller test

  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      get :index #performs a GET on the index view and expects the response to be successful.
      expect(response).to have_http_status(:success) #have_http_status = RSpec matcher encapsulating this logic.
    end
    it "assigns [my_post] to @posts" do
      get :index
      expect(assigns(:posts)).to eq([my_post])
     end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success) #have_http_status(:success) checks for response code of 200 (=standard HTTP response code for success)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
