class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :name
      t.date :purchase_date
      t.decimal :value
      
      t.timestamps null: false
    end
  end
end
