class Collectables < ActiveRecord::Migration
  def change
    create_table :collectables do |t|
      t.references :collection, index: true, foreign_key: true
      t.string :name
      t.date :purchased
      t.date :made
      t.decimal :value
      t.timestamps null: false
    end
  end
end
