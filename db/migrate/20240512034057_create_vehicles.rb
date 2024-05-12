class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :vehicle_type
      t.string :model
      t.string :color
      t.string :serial_number
      t.float :purchase_price
      t.date :purchase_date
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
