class AddCoordinatesToMemories < ActiveRecord::Migration[7.1]
  def change
    add_column :memories, :lat, :float
    add_column :memories, :lng, :float
  end
end
