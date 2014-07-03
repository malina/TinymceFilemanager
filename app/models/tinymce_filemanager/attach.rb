module TinymceFilemanager
  class Attach
    include Mongoid::Document
    include Mongoid::Timestamps::Short
    mount_uploader :file, TinymceFilemanager::FileUploader

    field :file, type: String
    field :ext, type: String
    field :size, type: String
    field :filename, type: String

    before_save :secondary_info

    def secondary_info
      self.size = file.size
      self.ext = file.extension
      self.filename = file.filename
    end

    
    def file_url
      file.url
    end  

  end

end
