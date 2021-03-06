class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :city
      t.string :state
      t.integer :zip
      t.belongs_to :home

      t.timestamps null: false
    end
  end
end
