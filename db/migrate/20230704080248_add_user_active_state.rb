class AddUserActiveState < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :active, :boolean, null: false, default: true
  end
end
