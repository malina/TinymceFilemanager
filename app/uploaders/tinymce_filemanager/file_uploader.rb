# encoding: utf-8
module TinymceFilemanager
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  class FileUploader < CarrierWave::Uploader::Base
    include CarrierWave::MimeTypes
    include Sprockets::Rails::Helper
    

    storage :file

    def store_dir
      "uploads/files/#{model.id}"
    end

    def extension
      #split_extension(sanitize(original_filename))[1] if sanitize(original_filename)
      model.file.file.extension
    end

    def filename

      "#{original_filename.parameterize.underscore}.#{extension}" if original_filename
    end


    def extension_white_list
      %w(txt doc docx pdf xls xlsx html rar zip)
    end
  end
end
