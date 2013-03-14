class CreateNicknames < ActiveRecord::Migration
  def change
    create_table :nicknames do |t|
      t.string :name
      t.references :name_group
    end
    add_index :nicknames, :name_group_id
  end
end
