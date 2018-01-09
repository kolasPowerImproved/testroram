class AddCurrentUserToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :current_user, :integer
  end
end
