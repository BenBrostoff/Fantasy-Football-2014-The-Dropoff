class Player < ActiveRecord::Base

  def calc_dropoff
    next_tier = Player.where("name != ? AND position = ? AND projection <= ? AND drafted = ?", 
                             self.name, self.position, self.projection, false).order("projection DESC", "name DESC")
    return self.projection - next_tier.first.projection if next_tier.size != 0
    return -1 if next_tier.size == 0
  end

  def calc_total_offense
    Player.where(team: self.team, offense: true).sum(:projection)
  end

  def calc_perc_contribute
    ((self.projection.to_f / self.total_offense.to_f) * 100).floor
  end

  def self.hash_offense
    teams = {}
    self.all.order("total_offense DESC").each do |player|
      teams[player.team] = player.total_offense
    end
    return teams
  end

  def self.hash_defense
    teams = {}
    self.where(position: "Def").order("projection DESC").each do |player|
      teams[player.team] = player.projection
    end
    return teams
  end

  def calc_percentile(rankings)
    team_points = rankings[self.team]
    points_array = rankings.values.reverse
    position = points_array.index(team_points) + 1

    return position * 100 / points_array.length
  end









end
