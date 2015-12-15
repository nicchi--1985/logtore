class TradeSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :action_type, :tradable_type, :invest_amount, \
  :invest_quantity, :implimentation_date, :benefit_amount, :change_rate, :benefit_rate
  belongs_to :tradable
  has_many :bases
end
