# encoding: utf-8
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include Sprockets::Rails::Helper
  
  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Choose what kind of storage to use for this uploader:
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/files/#{model.id}"
  end

  def extension
    #split_extension(sanitize(original_filename))[1] if sanitize(original_filename)
    model.file.file.extension
  end

  def filename
    #model.id ? "#{original_filename.parameterize}" : original_filename
    #"#{original_filename.split('.')[0].parameterize}.#{extension}" if original_filename
    #{}"avatar-#{model.id}.#{extension}" if original_filename
    #{}"user-photo.#{extension}" if original_filename
    "#{original_filename.parameterize.underscore}.#{extension}" if original_filename
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(txt doc docx pdf xls xlsx html rar zip)
  end
end
