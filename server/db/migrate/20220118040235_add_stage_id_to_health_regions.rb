class AddStageIdToHealthRegions < ActiveRecord::Migration
  def change
    add_reference :health_regions, :stage, index: true, foreign_key: true
  end
end
