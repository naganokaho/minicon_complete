class ImageUploader < CarrierWave::Uploader::Base  

  include CarrierWave::RMagick

   process :resize_to_limit => [200, 200]

  process :convert => 'jpg'

   version :thumb do
     process :resize_to_fill => [40, 40, gravity = ::Magick::CenterGravity]
   end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end



end