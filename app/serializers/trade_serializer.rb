class TradeSerializer < ActiveModel::Serializer
  attributes :user_id, :action_type, :tradable_type, :invest_amount, :invest_quantity, :implimentation_date, :benefit_amount
  belongs_to :tradable
  has_many :bases
end
