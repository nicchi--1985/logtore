class AddColumnToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :benifit_amount, :integer
  end
end
