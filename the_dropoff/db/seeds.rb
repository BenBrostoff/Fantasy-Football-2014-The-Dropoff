require 'CSV'

fantasy_data = CSV.read((File.join(Rails.root, 'db', 'season_14_project.csv')))

fantasy_data.each do |player|
  # excludes K and DEF
  if player[1] == "QB" || player[1] == "RB" || 
     player[1] == "TE" || player[1] == "WR" || player[1] == "Def"
    Player.create(position: player[1], name: "#{player[3]} #{player[2]}", 
                team: player[4], projection: player[-1].to_i, drafted: false,
                offense: true)
  end
end

Player.where(offense: true).each do |player|
  player.update(dropoff: player.calc_dropoff)
  player.update(total_offense: player.calc_total_offense)
  player.update(perc_contribute: player.calc_perc_contribute)
end

Player.where(offense: true).each do |player|
  player.update(offense_percentile: player.calc_offense_percentile)
end