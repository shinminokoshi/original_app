class Review < ApplicationRecord
    validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
    validates :content, presence: true, length: { maximum: 140 }
end
