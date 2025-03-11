class AddColumnsToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :title, :string
    add_column :memories, :description, :text
    add_column :memories, :image, :string
    add_reference :memories, :user, null: false, foreign_key: true
  end
end


