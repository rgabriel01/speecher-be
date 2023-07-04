class CreateUsersTable < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end

    add_index :users, :email
  end
end
