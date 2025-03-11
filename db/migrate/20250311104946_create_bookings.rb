class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :memorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
