class Player < ActiveRecord::Base

  def calc_dropoff
    next_tier = Player.where("name != ? AND position = ? AND projection <= ?", 
                             self.name, self.position, self.projection).order("projection DESC", "name DESC")
    return self.projection - next_tier.first.projection if next_tier.size != 0
    return -1 if next_tier.size == 0
  end

  def calc_total_offense
    Player.where(team: self.team).sum(:projection)
  end

  def calc_perc_contribute
    (self.projection.to_f / self.total_offense.to_f) * 100
  end


end
