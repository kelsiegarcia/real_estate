class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :seller_type
      t.string :seller_id

      t.timestamps null: false
    end
  end
end
