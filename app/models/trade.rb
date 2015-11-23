class Trade < ActiveRecord::Base
  belongs_to :tradable, polymorphic: true
end
