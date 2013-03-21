class CreatePeopleFirstNameTrigrams < ActiveRecord::Migration
  def self.up
    create_table :people_first_name_trigrams, :force => true do |t|
      t.integer :person_id, :null => false
      t.string :tg, :length => 3, :null => false # trigrams
      t.integer :score, :default => 1, :null => false
    end
    add_index :people_first_name_trigrams, :tg
    add_index :people_first_name_trigrams, :person_id
  end

  def self.down
    drop_table :people_first_name_trigrams
  end
end
