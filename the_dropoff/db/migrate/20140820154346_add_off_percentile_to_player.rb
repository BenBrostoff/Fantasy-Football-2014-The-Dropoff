class AddOffPercentileToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :offense_percentile, :integer
  end
end
