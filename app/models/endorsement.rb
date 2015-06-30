class Endorsement < ActiveRecord::Base
  belongs_to :investor

  validate :unique_endorsement

  def unique_endorsement
    errors.add(:recommendation_unique, "cannot endorse yourself") if investor_id == endorsed 
  end

end