# encoding: utf-8

class ScreenshotUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg gif png)
  end

  include CarrierWave::MiniMagick
  
  version :portfolio do
    process :resize_to_fit => [240, 240]
  end

end
