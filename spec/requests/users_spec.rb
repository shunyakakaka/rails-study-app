require 'rails_helper'

RSpec.describe "Users", type: :request do

  before "ログイン状態にしておく" do 
    @user = FactoryBot.create(:user)
    session_params = {session: {name: @user.name, gender: @user.gender, age: @user.age, job: @user.job, description: @user.description, overall_ranking: @user.overall_ranking, password: @user.password}}
    post "/login", params: session_params
  end
  
  describe "indexアクションがよばれた時" do
    it "正常に表示されているか" do
      get "/users"
      expect(response).to have_http_status(200)
    end
  end

  describe "newアクションがよばれた時" do
    it "正常に表示されているか" do
      get "/users/new"
      expect(response).to have_http_status(200)
    end
  end


  describe "showアクションがよばれた時" do
    it "正常に表示されているか" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "editアクションがよばれた時" do
    it "正常に表示されているか" do
      get "/users/#{@user.id}/edit"
      expect(response).to have_http_status(200)
    end
  end

  #ok

end
