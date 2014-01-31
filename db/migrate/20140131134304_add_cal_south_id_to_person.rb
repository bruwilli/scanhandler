class AddCalSouthIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :cal_south_id, :string
  end
end
