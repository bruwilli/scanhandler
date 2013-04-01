class NameGroup < ActiveRecord::Base
  has_many :nicknames, :dependent => :destroy
  attr_accessible :names
  after_save :handle_saved


  private
  def handle_saved
    self.names.split(',').each do |name|
      Nickname.create!(name: name, name_group_id: self.id)
    end
  end
end
