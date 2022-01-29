class Api::RestrictionsController < ApplicationController
  def show
    # get restrictions for a given PHU ID
    healthRegion = HealthRegion.find_by(region_code: params[:id])
    stage = Stage.joins(:health_regions).where("region_code = ?", params[:id])
    resObj = {
      region_name: healthRegion.region_name,
      region_code: healthRegion.region_code,
      max_indoor_gathering: stage[0].max_indoor_gathering,
      max_outdoor_gathering: stage[0].max_outdoor_gathering,
      food_establishments: stage[0].food_establishments,
      retail: stage[0].retail,
      ceremony: stage[0].ceremony,
      sports_recreational: stage[0].sports_recreational,
      entertainment: stage[0].entertainment,
      personal_care: stage[0].personal_care
    }
    render :json => resObj
  end
end
