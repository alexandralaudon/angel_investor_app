class Recommendation < ActiveRecord::Base
  belongs_to :investor

  validate :unique_recommendation

  def unique_recommendation
    if recommend1 == recommend2 || recommend1 == recommend3 || recommend2 == recommend3
      errors.add(:recommendation_unique, "cannot recommend someone twice")
    end
  end

end
