require 'CSV'

fantasy_data = CSV.read((File.join(Rails.root, 'db', 'season_14_project.csv')))

fantasy_data.each do |player|
  # excludes K 
  if player[1] == "QB" || player[1] == "RB" || 
     player[1] == "TE" || player[1] == "WR" || player[1] == "Def"
    new_player = Player.create(position: player[1], name: "#{player[3]} #{player[2]}", 
                team: player[4], projection: player[-1].to_i, drafted: false)
    new_player.update(offense: false) if new_player.position == "Def" 
  end
end

Player.where(offense: true).each do |player|
  player.update(dropoff: player.calc_dropoff)
  player.update(total_offense: player.calc_total_offense)
  player.update(perc_contribute: player.calc_perc_contribute)
end

offense_hash = Player.hash_offense
defense_hash = Player.hash_defense

Player.where(offense: false).each do |player|
  player.update(defense_percentile: player.calc_percentile(defense_hash))
end

Player.where(offense: true).each do |player|
  player.update(offense_percentile: player.calc_percentile(offense_hash))
  player.update(defense_percentile: Player.where(position: "Def", team: player.team).first.defense_percentile)
  player.update(o_d_delta: player.calc_o_d_delta)
end