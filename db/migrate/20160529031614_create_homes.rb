class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :amount, null: false
      t.string :bed
      t.string :bath
      t.string :square_footage
      t.boolean :sold

      t.timestamps null: false
    end
  end
end
