class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.string :description
      t.string :location
      t.float :purchase_price
      t.date :purchase_date
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
