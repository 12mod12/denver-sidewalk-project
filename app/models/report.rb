class Report < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :reporter, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true, length: { minimum: 1, maximum: 100 }
  validates :rating, presence: true, :inclusion => { :in => 1..5 }
  validates :description, presence: true, length: { minimum: 1, maximum: 300 }
end
