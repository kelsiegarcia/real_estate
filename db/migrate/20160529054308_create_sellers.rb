class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :seller_type

      t.timestamps null: false
    end
  end
end
