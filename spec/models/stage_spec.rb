require 'rails_helper'

RSpec.describe Stage, type: :model do
  describe 'stage' do
    before do
    end

    it "gets Peel Public Health's max. outdoor gatherings and color code" do
      stage = Stage.create(max_indoor_gathering: 5, max_outdoor_gathering: 10,
        food_establishments: "Indoor dining is closed. Takeout & Outdoor dining: Maximum of 4 people per table exclusing
        large households.",
        retail: "25% capacity of essential retail and 15% capacity of Non-essential retail both with no restricitons on
        goods being sold",
        ceremony: "Indoor religious services, rites, or ceremonies, including wedding services
        and funeral services permitted at up to 15 per cent capacity of the particular room. Outdoor services max capacity
        limited to the number of people that can maintain a physical distance of two metres.",
        sports_recreational: "Indoor sports and recreational fitness facilities are closed including gyms.Outdoor fitness classes,
        outdoor groups in personal training and outdoor individual/team sport training to be permitted with up toMaximum:10 people",
        entertainment: "Concert venues, theatres and cinemas may open outdoors for the purpose of rehearsing or performing
        a recorded or broadcasted concert, artistic event, theatrical performance or other performance with no more than
        10 performers",
        personal_care: "Salons and Barbershops closed to the general public",
        color_code: "red")
      healthRegionOne = stage.health_regions.create(region_name: "toronto", region_code: 3212)
      stage_health = Stage.joins(:health_regions)
      healthRegion = stage_health.where("region_name = ?", "toronto")
      expect(healthRegion[0].max_outdoor_gathering).to eq(10)
      expect(healthRegion[0].color_code).to eq("red")
    end

    it "gets Hamilton Public Health Services region name, region code and food establishments" do
      stage = Stage.create(max_indoor_gathering: 5, max_outdoor_gathering: 10,
        food_establishments: "Indoor dining is closed. Takeout & Outdoor dining: Maximum of 4 people per table exclusing
        large households.",
        retail: "25% capacity of essential retail and 15% capacity of Non-essential retail both with no restricitons on
        goods being sold",
        ceremony: "Indoor religious services, rites, or ceremonies, including wedding services
        and funeral services permitted at up to 15 per cent capacity of the particular room. Outdoor services max capacity
        limited to the number of people that can maintain a physical distance of two metres.",
        sports_recreational: "Indoor sports and recreational fitness facilities are closed including gyms.Outdoor fitness classes,
        outdoor groups in personal training and outdoor individual/team sport training to be permitted with up toMaximum:10 people",
        entertainment: "Concert venues, theatres and cinemas may open outdoors for the purpose of rehearsing or performing
        a recorded or broadcasted concert, artistic event, theatrical performance or other performance with no more than
        10 performers",
        personal_care: "Salons and Barbershops closed to the general public",
        color_code: "red")
      healthRegionOne = stage.health_regions.create(region_name: "toronto", region_code: 3212)
      stage_health = Stage.joins(:health_regions).where("region_name = ?", "toronto")
      healthRegion = HealthRegion.find_by(region_name: "toronto")
      expect(healthRegion.region_name).to eq("toronto")
      expect(healthRegion.region_code).to eq("3212")
      expect(stage_health[0].personal_care).to eq("Salons and Barbershops closed to the general public")
    end
  end
end