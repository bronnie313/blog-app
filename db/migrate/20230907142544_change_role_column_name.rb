class ChangeRoleColumnName < ActiveRecord::Migration[7.0]
  def change
      rename_column :users, :Role, :role
  end
end
