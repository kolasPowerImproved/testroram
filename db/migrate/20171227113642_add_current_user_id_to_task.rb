class AddCurrentUserIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :current_user_id, :integer
  end
end
