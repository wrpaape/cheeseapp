class CreateCheeses < ActiveRecord::Migration
  def change
    create_table :cheeses do |t|
      t.string :name
      t.string :variety
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
