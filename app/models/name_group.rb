class NameGroup < ActiveRecord::Base
  has_many :nicknames, :dependent => :destroy
  attr_accessible :names
  after_save :handle_saved


  private
  def handle_saved
    self.names.split(',').each do |name|
      self.nicknames.create(name: name)
    end
  end
end
