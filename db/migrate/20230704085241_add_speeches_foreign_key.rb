class AddSpeechesForeignKey < ActiveRecord::Migration[7.0]
  def up
    add_foreign_key :speeches, :users, column: :user_id
  end
end
