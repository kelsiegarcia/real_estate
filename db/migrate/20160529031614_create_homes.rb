class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.float :amount
      t.integer :bed
      t.integer :bath
      t.integer :square_footage
      t.boolean :sold
      t.belongs_to :seller

      t.timestamps null: false
    end
  end
end
