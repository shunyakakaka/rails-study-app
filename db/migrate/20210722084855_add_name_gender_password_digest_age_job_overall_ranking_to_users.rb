class AddNameGenderPasswordDigestAgeJobOverallRankingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :gender, :string
    add_column :users, :password_digest, :string, null: false
    add_column :users, :age, :integer
    add_column :users, :job, :string
    add_column :users, :overall_ranking, :integer, default: 0
  end
end
