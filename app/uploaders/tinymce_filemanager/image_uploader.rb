# encoding: utf-8
module TinymceFilemanager
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick
    include Sprockets::Rails::Helper
    
    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    def extension
      model.image.file.extension
    end

    def filename
      name = original_filename.parameterize.underscore
      name.slice!("_#{extension}")
      "#{name}.#{extension}" if original_filename
    end

    process :resize_to_limit => [940, 10000]
    version :thumb do
      process :resize_to_fill => [305,230]
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

  end
end
