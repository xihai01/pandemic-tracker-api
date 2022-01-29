# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require('faker')

3.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test@test.com', password: '123')
end

6.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: 'test@test.com', password: '123')
end

Stage.create(max_indoor_gathering: 5, max_outdoor_gathering: 10,
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

Stage.create(max_indoor_gathering: 5,
  max_outdoor_gathering: 10 , food_establishments: "Indoor dining is closed. Outdoor dining has some restrictions. ",
  retail:"50% capacity. For shopping malls physical distancing will be required in line-ups,
  loitering will not be permitted and food courts will be required to close." ,
  ceremony: "Indoor religious services, rites, or ceremonies, including wedding services
  and funeral services limited to 50% capacity of the room.",
  sports_recreational:"Indoor sports and recreational fitness facilities are closed including gyms except
  for except for professional athletes. Outdoor facilities limited by 50% occupancy.",
  entertainment:"Indoor concert venues, theatres, cinemas are closed. Rehearsals and recorded performances
  permitted with restrictions.",
  personal_care: "50% capacity and other restrictions. Saunas, steam rooms,
  and oxygen bars closed.",
  color_code: "orange")

Stage.create(max_indoor_gathering: 25, max_outdoor_gathering: 100,
  food_establishments: "Indoor dining permitted with no limits to number of peopl per table. Indoor food or
  drink establishments where dance facilities are provided, including nightclubs and
  restobars, permitted up to 25 per cent capacity or up to a maximum limit of 250 people (whichever is less)",
  retail: "Capacity limited to the number of people that can maintain a physical distance of two metres",
  ceremony:"Indoor religious services, rites or ceremonies, including wedding services and
  funeral services permitted with physical distancing;",
  sports_recreational: "Maximum 50% capacity or 1000 people(whichever is less). Outdoor: 75% capacity or 15,000 people
  whichever is less",
  entertainment: "Concert, cinemas, and theatres can operate at  50 per cent capacity indoors or 1000 peopl which ever
  is less or 75% Capacity outdoors or a maximum of 5,000 people for unseated events (whichever is less); 75% capacity
  outdoors or a maximum of 15,000 people for events with fixed seating (whichever is less)",
  personal_care: "Services that require removal of face coverings capacity is limited to the number of people that can
  maintain a physical distance of two metres;",
  color_code: "green")

# seed health regions table
data = File.read("./docs/map_data.geojson")
dataHash = JSON.parse(data)
dataHash['features'].each do |healthRegion|
  name = healthRegion['properties']['NAME_ENG']
  phuID = healthRegion['properties']['PHU_ID']
  stage = 1 + rand(3)
  HealthRegion.create(region_name: name, region_code: phuID, stage_id: stage)
end
