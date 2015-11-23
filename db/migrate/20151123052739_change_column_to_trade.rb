class ChangeColumnToTrade < ActiveRecord::Migration
  def change
    change_column :trades, :invest_type, :string
    rename_column :trades, :invest_type, :tradable_type
    rename_column :trades, :target_code, :tradable_id
  end
end
