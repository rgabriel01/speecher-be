class AddSpeechDeleteState < ActiveRecord::Migration[7.0]
  def up
    add_column :speeches, :deleted, :boolean, null: false, default: false
  end
end
