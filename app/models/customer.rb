class Customer < ApplicationRecord
    # validates :first_name, presence: false, length: { minimum: 51, message: "must be larger than 50 character" }
    # validates :last_name, presence: false, length: { minimum: 51 }

    # validate :first_name_must_be_larger_than_fifty
    # private
    # def first_name_must_be_larger_than_fifty
    #   errors.add(:first_name, "must be larger than 50 character") if first_name.length < 50
    # end
end
