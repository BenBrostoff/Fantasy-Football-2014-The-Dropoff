class AddOffenseToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :total_offense, :integer
    add_column :players, :perc_contribute, :integer
  end
end
