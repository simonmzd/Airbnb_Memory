class CreateMemories < ActiveRecord::Migration[7.1]
  def change
    create_table :memories do |t|

      t.timestamps
    end
  end
end
