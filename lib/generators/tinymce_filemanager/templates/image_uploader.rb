# encoding: utf-8
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper
  
  storage :file



  def cache_dir
    "/home/shum/tmp/uploads/cache/#{model.id}"
  end

  def store_dir
    #"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    if model.work_id
      "/uploads/works/#{Work.find(model.work_id).name.to_s.parameterize.underscore}"
    else
      "uploads/images/#{model.id}"
    end
  end

  def extension
    #split_extension(sanitize(original_filename))[1] if sanitize(original_filename)
    model.image.file.extension
  end

  def filename
    #model.id ? "#{original_filename.parameterize}" : original_filename
    #"#{original_filename.split('.')[0].parameterize}.#{extension}" if original_filename
    #{}"avatar-#{model.id}.#{extension}" if original_filename
    #{}"user-photo.#{extension}" if original_filename
    name = original_filename.parameterize.underscore
    name.slice!("_#{extension}")
    "#{name}.#{extension}" if original_filename
  end


  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
  #   "/images/book.png"
  # end

  # Process files as they are uploaded:
  #process :resize_to_fill => [160, 160]
  process :resize_to_limit => [940, 10000]
  version :thumb do
    process :resize_to_fill => [305,230]
  end
  # version :content do
  #   process :resize_to_limit => [700,14000]
  # end
  # version :mini do
  #   process :resize_to_fill => [60,60]
  # end
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
