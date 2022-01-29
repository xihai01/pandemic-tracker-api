class Api::MapColorController < ApplicationController
  def index
    # fetch health region data
    stageObj = {}
    HealthRegion.find_each do |healthRegion|
      # the key => PHU_ID and value => stage #
      key = healthRegion.region_code
      value = healthRegion.stage_id
      stageObj[key] = value
    end
    # send to client as an object
    render json: stageObj
  end
end
