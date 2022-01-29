class HealthRegion < ActiveRecord::Base
  belongs_to :stage
  validates :region_name, presence: true
  validates :region_code, presence: true
end
