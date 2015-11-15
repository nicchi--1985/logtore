# create_table :trades do |t|
#   t.integer :user_id
#   t.integer :action_type  # 0:buy, 1:sell, 2:stay
#   t.integer :invest_type  # 0:stock, 1:futures, 2:options, 3:exchange. 4:real_estate
#   t.integer :invest_amount # 投資額（単価）
#   t.integer :invest_quantity  # 売買個数
#   t.integer :target_code  # 投資物を一意に表すコード
#   t.datetime  :implimentation_date
#   t.timestamps null: false
# end

class Trade < ActiveRecord::Base
end
