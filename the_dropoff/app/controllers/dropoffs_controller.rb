class DropoffsController < ApplicationController

  def index
    @rbs = Player.where("position = 'RB'").order("projection DESC, dropoff DESC").take(10)
    @qbs = Player.where("position = 'QB'").order("projection DESC, dropoff DESC").take(10) 
    @wrs = Player.where("position = 'WR'").order("projection DESC, dropoff DESC").take(10)
    @tes = Player.where("position = 'TE'").order("projection DESC, dropoff DESC").take(10)

    @pos_array = [@rbs, @qbs, @wrs, @tes]
  end

  def drafted
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to :root
  end

end
