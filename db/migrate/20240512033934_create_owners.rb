class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email_address
      t.string :contact_number

      t.timestamps
    end
  end
end
