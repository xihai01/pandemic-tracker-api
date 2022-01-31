require 'rails_helper'

RSpec.describe Api::RestrictionsController, type: :controller do

  describe "GET #show" do
    it "renders a valid JSON object as response" do
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
      healthRegionOne = stage.health_regions.create(region_name: "toronto", region_code: "3212")
      # GET api/restrictions with param => '2270'
      healthRegion = HealthRegion.find_by(region_code: "3212")
      stage = Stage.joins(:health_regions).where("region_code = ?", "3212")
      obj = {
        region_name: healthRegion.region_name,
        region_code: healthRegion.region_code,
        retail: stage[0].retail,
        personal_care: stage[0].personal_care
      }
      get :show, :id => "3212"
      responseJSON = JSON.parse(response.body)
      # expect response to contain restriction data for PHU ID = 2270
      expect(responseJSON["region_name"]).to eq(obj[:region_name])
      expect(responseJSON["region_code"]).to eq(obj[:region_code])
      expect(responseJSON["retail"]).to eq(obj[:retail])
      expect(responseJSON["personal_care"]).to eq(obj[:personal_care])
      expect(response).to have_http_status(:success)
    end
  end

end
