require 'rails_helper'

RSpec.feature 'ログインとログアウト' do
  describe "ログイン機能" do
    before do
      # ユーザを作成する
      @user = FactoryBot.create(:user)
    end
    it 'ログインする' do
      # ログインページを開く
      visit "/login"
      # ログインフォームにnameとパスワードを入力する
      fill_in 'session[name]', with: @user.name
      fill_in 'session[password]', with: @user.password
      # ログインボタンをクリックする
      click_on 'ログイン'
      # ログインに成功したことを検証する
      expect(page).to have_content 'ログインしました'
    end
  end
  


  
end