class Endorsement < ActiveRecord::Base
  belongs_to :investor

  validate :unique_endorsement

  # def unique_endorsement
  #   if investor_idendorsedEndorsement.where(endorserecommend1 == recommend2 || recommend1 == recommend3 || recommend2 == recommend3
  #     errors.add(:recommendation_unique, "cannot recommend someone twice")
  #   end
  # end

end
