module DropoffsHelper

  def mark_set(dropoff)
    return "normal" if dropoff < 10 
    return "elevated" if dropoff >= 10 && dropoff < 20 
    return "high_elevated" if dropoff >= 20 
  end

end
