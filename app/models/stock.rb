class Stock < ActiveRecord::Base
  has_many  :trades, as: :tradable
end
