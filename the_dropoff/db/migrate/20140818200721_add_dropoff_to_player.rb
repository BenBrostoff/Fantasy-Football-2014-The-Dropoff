class AddDropoffToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :dropoff, :integer
  end
end
