require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#index" do
    before do
      @user_1 = FactoryBot.create(:user)
      @record_1 = FactoryBot.create(:record, user: @user_1)
      @user_2 = FactoryBot.create(:user, name: "テストユーザー2")
      @record_2 = FactoryBot.create(:record, user: @user_2, total_time: 120)
      @user_3 = FactoryBot.create(:user, name: "片田竣也")
    
      def set_rank
        @users = User.all
        k = 0
        has_records_user = []
        no_records_user = []
        
        @users.each_with_index do |user, index|
          if user.records.all.last == nil
            no_records_user << user
          else
            has_records_user << user
          end
        end
    
        has_records_user = has_records_user.sort{|a, b| b.records.all.last.total_time <=> a.records.all.last.total_time}
    
        @users = has_records_user | no_records_user
        
        @users.each_with_index do |user, index|
          if user.records.all.last == nil 
            if @users[index + 1] != nil
              @users[index..@users.length - 1].each do |user|
                user.overall_ranking += index + 1
              end
            else
              user.overall_ranking += index + 1
            end
            break
          elsif index == 0
            user.overall_ranking += index + 1
            k = user
            next
          elsif user.records.all.last.total_time == k.records.all.last.total_time
            user.overall_ranking = k.overall_ranking
          else
            user.overall_ranking += index + 1
          end
          k = user
        end
      end
      set_rank
    end
  
    it "ユーザーランキングが正しい順番であるかどうか" do
      expect(@users[0]).to eq @user_2
      expect(@users[1]).to eq @user_1
      expect(@users[2].overall_ranking).to eq 3
    end
  end
  #ok
end
