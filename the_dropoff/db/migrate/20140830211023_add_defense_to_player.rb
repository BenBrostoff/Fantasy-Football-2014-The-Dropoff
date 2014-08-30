class AddDefenseToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :defensive_percentile, :integer
    add_column :players, :o_d_delta, :integer
    add_column :players, :offense, :boolean
  end
end
