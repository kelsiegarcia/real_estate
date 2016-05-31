class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.integer :amount
      t.string :bed
      t.string :bath
      t.string :square_footage
      t.boolean :sold
      t.string :seller_id
      t.string :home_id
      t.belongs_to :seller

      t.timestamps null: false
    end
  end
end
