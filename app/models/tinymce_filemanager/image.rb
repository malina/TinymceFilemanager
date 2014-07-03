module TinymceFilemanager
  class Image
    include Mongoid::Document
    include Mongoid::Timestamps::Short
    mount_uploader :image, TinymceFilemanager::ImageUploader

    field :image, type: String
    field :text, type: String
    field :ext, type: String
    field :filename, type: String
    field :size, type: String

    before_save :secondary_info
    def secondary_info
      self.ext = image.extension
      self.filename = image.filename
      self.size = image.size
    end

    def image_url
      image.url
    end
  end
end
