class Stage < ActiveRecord::Base
  has_many :health_regions

  validates :max_indoor_gathering, presence: true
  validates :max_outdoor_gathering, presence: true
  validates :color_code, presence: true
  validates :entertainment, presence: true
  validates :ceremony, presence: true
  validates :personal_care, presence: true
  validates :food_establishments, presence: true
  validates :sports_recreational, presence: true
  validates :retail, presence: true


end

