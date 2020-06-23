class AddRecommendStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recommend_status, :integer
  end
end
