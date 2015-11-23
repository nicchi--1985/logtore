class CreateFutures < ActiveRecord::Migration
  def change
    create_table :futures do |t|
      t.integer :index_code
      t.integer :year
      t.integer :month
      t.timestamps null: false
    end
  end
end
