class AddSpeechesTags < ActiveRecord::Migration[7.0]
  def up
    add_column :speeches, :tags, :string
  end
end
