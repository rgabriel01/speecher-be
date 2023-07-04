class CreateSpeeches < ActiveRecord::Migration[7.0]
  def up
    create_table :speeches do |t|
      t.text :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
