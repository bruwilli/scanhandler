class Scan < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  attr_accessible :scan_date, :image
  has_attached_file :image
  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpg","image/png", "application/pdf", "image/tiff", "image/jpeg" ]},
                                :size => { :in => 0..5.megabytes }
  validates :scan_date, presence: true
end
