class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :room, index: true, foreign_key: true
      t.string :name
      t.decimal :value
      t.date :purchase_date
      t.timestamps null: false
    end
  end
end
