class Scan < ActiveRecord::Base
  belongs_to :user
  belongs_to :person
  attr_accessible :scan_date, :image
  has_attached_file :image
  validates_attachment :image, :presence => true,
                                :content_type => { :content_type => ["image/jpg","image/png", "application/pdf", "image/tiff", "image/jpeg" ]},
                                :size => { :in => 0..5.megabytes }
  validates :scan_date, presence: true
  validate :scan_date_not_in_future

  before_save :rename_image

private
  def rename_image
    if self.new_record?
      extension = File.extname(image_file_name).downcase
      num_scans = 0
      person = self.person
      scans = person.scans
      num_scans = scans.count if not scans.nil?
      new_file_name = "#{person.first_name}_#{person.last_name}_scan#{(num_scans + 1).to_s}#{extension}"
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
