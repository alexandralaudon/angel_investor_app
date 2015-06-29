class Investor < ActiveRecord::Base
  has_one :recommendation

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
