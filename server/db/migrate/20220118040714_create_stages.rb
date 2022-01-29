class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :max_indoor_gathering
      t.integer :max_outdoor_gathering
      t.string :retail
      t.string :ceremony
      t.string :food_establishments
      t.string :sports_recreational
      t.string :entertainment
      t.string :personal_care
      t.string :color_code
      t.timestamps null: false
    end
  end
end
