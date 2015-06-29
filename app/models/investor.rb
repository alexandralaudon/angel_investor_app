class Investor < ActiveRecord::Base
  has_one :recommendation
end
