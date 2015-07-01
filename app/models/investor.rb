class Investor < ActiveRecord::Base
  has_many :endorsements
  has_many :endorsed, through: :endorsements

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end
