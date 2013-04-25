class CreateScans < ActiveRecord::Migration
  def change
    create_table :scans do |t|
      t.references :user
      t.references :person
      t.date :scan_date

      t.timestamps
    end
    add_index :scans, :user_id
    add_index :scans, :person_id
  end
end
