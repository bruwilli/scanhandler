class CreateTrigramsTableForNickname < ActiveRecord::Migration
  def self.up
    create_table :trigrams_for_nicknames, :force => true do |t|
      t.integer :nickname_id, :null => false
      t.string :tg, :length => 3, :null => false # trigrams
      t.integer :score, :default => 1, :null => false
    end
    add_index :trigrams_for_nicknames, :tg
    add_index :trigrams_for_nicknames, :nickname_id
  end

  def self.down
    drop_table :trigrams_for_nicknames
  end
end
