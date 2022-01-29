require 'rails_helper'

RSpec.describe Api::RestrictionsController, type: :controller do

  describe "GET #show" do
    it "renders a valid JSON object as response" do
      # GET api/restrictions with param => '2270'
      healthRegion = HealthRegion.find_by(region_code: "2270")
      stage = Stage.joins(:health_regions).where("region_code = ?", "2270")
      obj = {
        region_name: healthRegion.region_name,
        region_code: healthRegion.region_code,
        retail: stage[0].retail,
        personal_care: stage[0].personal_care
      }
      get :show, :id => "2270"
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
