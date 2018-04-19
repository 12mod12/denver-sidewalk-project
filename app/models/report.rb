# frozen_string_literal: true
# A model for capturing sidewalk status reports
#
# @param [String] reporter A valid email used for contacting the reporter
# @param [String] address The location of the sidewalk in question
# @param [Number] rating A rating of the sidewalk, 1 to 5, 5 being the worst
# @param [String] descrition A detailed description of the sidewalk in question
# @param [Number] lat *optional* The latitude of the sidewalk in question
# @param [Number] lng *optional* The longitude of the sidewalk in question
class Report < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :reporter, presence: true, length: { maximum: 255 },
                       format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true, length: { minimum: 1, maximum: 100 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :description, presence: true, length: { minimum: 1, maximum: 300 }
end
