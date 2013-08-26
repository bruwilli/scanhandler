class CreatePersonNotes < ActiveRecord::Migration
  def change
    create_table :person_notes do |t|
      t.text:text
      t.references :user
      t.references :person

      t.timestamps
    end
    add_index :person_notes, :user_id
    add_index :person_notes, :person_id
  end
end
