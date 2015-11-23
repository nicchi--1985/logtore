class Exchange < ActiveRecord::Base
  has_many  :trades, as: :tradable
end
