class DropoffsController < ApplicationController

  def index
    @rbs = Player.where("position = 'RB', drafted: false").order("projection DESC, dropoff DESC").take(10)
    @qbs = Player.where("position = 'QB', drafted: false").order("projection DESC, dropoff DESC").take(10) 
    @wrs = Player.where("position = 'WR', drafted: false").order("projection DESC, dropoff DESC").take(10)
    @tes = Player.where("position = 'TE', drafted: false").order("projection DESC, dropoff DESC").take(10)

    @pos_array = [@rbs, @qbs, @wrs, @tes]
  end

  def reset
    Player.all.each { |player| player.drafted = false }
  end

  def offense
    # group by teams
  end

  def drafted
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to :root
  end

end
