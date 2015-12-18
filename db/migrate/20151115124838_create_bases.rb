class CreateBases < ActiveRecord::Migration
  def change
    create_table :bases do |t|
      t.integer :trade_id
      t.integer :basis_type # 0:news, 1:tecnical
      t.string  :text
      t.timestamps null: false
    end
  end
end
