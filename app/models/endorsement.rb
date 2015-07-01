class Endorsement < ActiveRecord::Base
  belongs_to :investor
  belongs_to :endorsed, :class_name => 'Investor'

  validates :investor_id, presence: true
  validates :endorsed_id, presence: true
  validates :comment, presence: true

  validate :unique_endorsement

  def unique_endorsement
    errors.add(:recommendation_unique, "cannot endorse yourself") if investor_id == endorsed
  end

end
