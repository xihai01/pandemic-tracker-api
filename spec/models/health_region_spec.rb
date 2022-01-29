require 'rails_helper'

RSpec.describe HealthRegion, type: :model do
  describe 'Health region' do
    before do
      @stage = Stage.create(max_indoor_gathering: 5, max_outdoor_gathering: 10,
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
        @healthRegionOne = HealthRegion.create(region_name: "toronto", region_code: 3212, stage_id: 1)
        @healthRegionTwo = HealthRegion.create(region_name: "london", region_code: 3982, stage_id: 1)
    end

    it 'fetches data in healthRegions table' do
      code = ["2270", "5183", "2265"]
      i = 0
      HealthRegion.find_each do |healthRegion|
        if i == 3
          break
        end
        expect(healthRegion.region_code).to eq(code[i])
        i = i + 1
      end
    end

    it 'returns an object of PHU_ID (key) and stage_id (value)' do
      result = {
        '2270': 1,
        '5183': 3,
        '2265': 2
      }
      obj = {}
      i = 0
      HealthRegion.find_each do |healthRegion|
        if i == 3
          break
        end
        key = healthRegion.region_code
        value = healthRegion.stage_id
        obj[key] = value
        i = i + 1
      end
      expect(obj).to include('2270': 1, '5183': 3, '2265': 2)
    end
  end
end