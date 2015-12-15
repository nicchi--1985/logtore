class AddRateColumnToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :change_rate, :float
    add_column :trades, :benefit_rate, :float
  end
end
