class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production? || Rails.env.staging?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def size_range
    0..1.megabytes
  end

  def extension_whitelist
    %w(jpg jpeg gif png mp4)
  end

end
