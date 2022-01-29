require 'rails_helper'

RSpec.describe Stage, type: :model do
  describe 'stage' do
    before do
    end

    it "gets Peel Public Health's max. outdoor gatherings and color code" do
      stage = Stage.joins(:health_regions)
      healthRegion = stage.where("region_name = ?", "Peel Public Health")
      expect(healthRegion[0].max_outdoor_gathering).to eq(10)
      expect(healthRegion[0].color_code).to eq("orange")
    end

    it "gets Hamilton Public Health Services region name, region code and food establishments" do
      stage = Stage.joins(:health_regions).where("region_name = ?", "Hamilton Public Health Services")
      healthRegion = HealthRegion.find_by(region_name: "Hamilton Public Health Services")
      expect(healthRegion.region_name).to eq("Hamilton Public Health Services")
      expect(healthRegion.region_code).to eq("2237")
      expect(stage[0].food_establishments).to eq("Indoor dining permitted with no limits to number of peopl per table. Indoor food or
        drink establishments where dance facilities are provided, including nightclubs and
        restobars, permitted up to 25 per cent capacity or up to a maximum limit of 250 people (whichever is less)")
    end
  end
end