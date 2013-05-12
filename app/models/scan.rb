require 'action_view'
include ActionView::Helpers::NumberHelper

class Scan < ActiveRecord::Base
  MAX_FILE_SIZE = 5.megabytes
  belongs_to :user
  belongs_to :person
  attr_accessible :scan_date, :image
  has_attached_file :image, styles: { :pdf => ["100%", :pdf] }, processors: [:pdf_processor]
  #validates_attachment :image, :presence => true,
                                #:content_type => { :content_type => ["image/jpg","image/png", "application/pdf", "image/tiff", "image/jpeg" ]},
                                #:size => { :in => 0..5.megabytes }
  validates_attachment_presence :image, message: "You must supply a scan image file"
  #validate :validate_image_file_size
  #validates_attachment_content_type :image, content_type: ["image/jpg",
                                                           #"image/png", 
                                                           #"application/pdf", 
                                                           #"image/tiff", 
                                                           #"image/jpeg" ], 
                                            #message: "Only jpf, png, pdf, or tiff files are allowed"
  #validates_attachment_size :image, less_than: 5.megabytes, message: "Files must be less than 5 megabytes"

  validates :scan_date, presence: true
  validate :scan_date_not_in_future
  validate :correct_content_type
  validate :acceptable_file_size

  before_save :rename_image

private
  def correct_content_type
    if !['image/jpg', 'image/png','application/pdf', 'image/tiff','image/jpeg'].include?(self.image_content_type)
      errors.add(:image, "Only jpf, png, pdf, or tiff files are allowed")
    end
  end

  def acceptable_file_size
    file_size = self.image_file_size
    if not file_size.nil? and not file_size < MAX_FILE_SIZE
      errors.add(:image, "Maximum scan file size is " + number_to_human_size(MAX_FILE_SIZE) + 
                         ".  Yours was " + number_to_human_size(file_size))
    end
  end


  def rename_image
    if self.new_record?
      num_scans = 0
      person = self.person
      scans = person.scans
      num_scans = scans.count if not scans.nil?
      new_file_name = "#{person.first_name}_#{person.last_name}_scan#{(num_scans + 1).to_s}.pdf"
      new_file_name = sanitize_filename(new_file_name)
      self.image.instance_write :file_name, new_file_name
    end
  end

  def sanitize_filename(filename)
    # Split the name when finding a period which is preceded by some
    # character, and is followed by some character other than a period,
    # if there is no following period that is followed by something
    # other than a period (yeah, confusing, I know)
    fn = filename.split /(?<=.)\.(?=[^.])(?!.*\.[^.])/m

    # We now have one or two parts (depending on whether we could find
    # a suitable period). For each of these parts, replace any unwanted
    # sequence of characters with an underscore
    fn.map! { |s| s.gsub /[^a-z0-9\-]+/i, '_' }

    # Finally, join the parts with a period and return the result
    return fn.join '.'
  end

  def scan_date_not_in_future
    if !scan_date.blank? and scan_date > Date.today
      errors.add(:scan_date, "can't be in future")
    end
  end
end
