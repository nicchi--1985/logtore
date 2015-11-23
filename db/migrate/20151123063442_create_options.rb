class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :option_type
      t.integer :index_code
      t.integer :exercise_price
      t.integer :year
      t.integer :month
      t.timestamps null: false
    end
  end
end
