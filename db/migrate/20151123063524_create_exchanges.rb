class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.string :base_currency
      t.string :quote_currency
      t.timestamps null: false
    end
  end
end
