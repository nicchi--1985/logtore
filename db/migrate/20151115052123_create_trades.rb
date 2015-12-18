class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :user_id
      t.integer :action_type  # 0:buy, 1:sell, 2:stay
      t.boolean :forecast     # true:予想, false:実績
      t.string :tradable_type  # ポリモーフィック
      t.integer :tradable_id
      t.integer :invest_amount # 投資額（単価）
      t.integer :invest_quantity  # 売買個数
      t.integer :benefit_amount # 利益額
      t.float   :change_rate    # 騰落率
      t.float   :benefit_rate   # 利益率
      t.datetime  :implimentation_date
      t.timestamps null: false
    end
  end
end
