class CreateNicknameTrigrams < ActiveRecord::Migration
  def change
    create_table :nickname_trigrams do |t|
      t.string :tg
      t.references :nickname
      t.integer :score, :default => 1
    end
    add_index :nickname_trigrams, :nickname_id
  end
end
