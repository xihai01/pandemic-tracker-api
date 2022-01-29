class CreateHealthRegions < ActiveRecord::Migration
  def change
    create_table :health_regions do |t|
      t.string :region_name
      t.string :region_code
      t.timestamps null: false
    end
  end
end
