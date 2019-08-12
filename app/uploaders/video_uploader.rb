class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    1..2.megabytes
  end

  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

end
