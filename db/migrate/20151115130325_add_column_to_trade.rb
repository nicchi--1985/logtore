class AddColumnToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :benefit_amount, :integer
  end
end
