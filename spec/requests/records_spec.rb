require 'rails_helper'

RSpec.describe "Records", type: :request do
  before "ログイン状態にしておく" do
    @user = FactoryBot.create(:user)
    session_params = {session: {name: @user.name, gender: @user.gender, age: @user.age, job: @user.job, description: @user.description, overall_ranking: @user.overall_ranking, password: @user.password}}
    post "/login", params: session_params
  end

  describe "showアクションがよばれた時" do
    it "正常に表示されているかどうか" do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "newアクションがよばれた時" do
    it "正常に表示されているかどうか" do
      get "/records/new"
      expect(response).to have_http_status(200)
    end
  end

  #ok

end
