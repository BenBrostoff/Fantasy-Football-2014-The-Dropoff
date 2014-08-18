module DropoffsHelper

  def table_show(array)
    array.each_with_index do |player, index|
      "#{index}. "
      player.name
      player.position
      player.dropoff
    end
  end
end
