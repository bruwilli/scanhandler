class CreateNameGroups < ActiveRecord::Migration
  def change
    create_table :name_groups do |t|
      t.string :names
    end
  end
end
