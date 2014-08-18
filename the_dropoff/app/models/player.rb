class Player < ActiveRecord::Base

  def calc_dropoff
    next_tier = Player.where("name != ? AND position = ? AND projection <= ?", 
                             self.name, self.position, self.projection).order("projection DESC")
    return self.projection - next_tier.first.projection if next_tier.size != 0
    return -1 if next_tier.size == 0
  end

end
