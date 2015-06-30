class Investor < ActiveRecord::Base
  has_many :endorsements
  
  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
