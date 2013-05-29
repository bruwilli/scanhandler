require 'RMagick'
include Magick

module Paperclip
  class PdfProcessor < Processor
    
    def initialize file, options = {}, attachment = nil
      @file           = file
      @options        = options
      @instance       = attachment.instance
      @attachment     = attachment
      @current_format = (File.extname(attachment.instance.image_file_name).downcase)[1..-1]
      @basename       = File.basename(@file.path, @current_format)
      @whiny          = options[:whiny].nil? ? true : options[:whiny]
    end

    def make
      begin
        path = @current_format == "pdf" ? (@file.path + "[0]") : @file.path
        #if @current_format != "pdf"
          image = Magick::Image.read(path).first.resize_to_fit(1650)
          image.format = 'PDF'
          @current_format = "pdf"
          tmp = Tempfile.new([@basename, @current_format].compact.join("."))
          image.write( tmp.path) { self.quality = 75 }
          tmp.flush
          @attachment.instance_write(:content_type, "application/pdf")
          @attachment.instance_write(:file_size, tmp.size)

          @file = tmp
        #end
                 
        @file
      rescue StandardError => e
        raise Paperclip::Error, "There was an error processing the file contents for #{@basename} - #{e}" if @whiny
      end
    end
  end
end