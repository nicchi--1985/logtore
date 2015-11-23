class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :brand_code
      t.string  :name
      t.integer :stock_market
      t.timestamps null: false
    end
  end
end
