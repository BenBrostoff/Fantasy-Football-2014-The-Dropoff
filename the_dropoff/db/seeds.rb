require 'CSV'

fantasy_data = CSV.read((File.join(Rails.root, 'db', 'season_14_project.csv')))

fantasy_data.each do |player|
  Player.create(position: player[1], name: "#{player[3]} #{player[2]}", 
                team: player[4], projection: player[-1].to_i)
end

Player.all.each do |player|
  player.update(dropoff: player.calc_dropoff)
end
