class AddDateAndLocationToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :date, :date
    add_column :memories, :location, :string
  end
end
