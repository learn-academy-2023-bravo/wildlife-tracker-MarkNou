
class Animal < ApplicationRecord
    has_many :sights
    validates :common, :binomial, presence: true
    validates :common, uniqueness: true
    validates :common, uniqueness: { scope: :binomial }
    validate :common_cannot_be_same_as_binomial

    def common_cannot_be_same_as_binomial
        if common == binomial
            errors.add(:common, 'Cannot be the same as binomial')
        end
    end
end


    
