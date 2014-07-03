require 'rails/generators'
module TinymceFilemanager
  class InstallGenerator < Rails::Generators::Base
    desc "Some description of my generator here"
    def self.source_root
      @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    def add_uploader
       # template('image_uploader.rb', 'app/uploaders/image_uploader.rb') 
       # template('file_uploader.rb', 'app/uploaders/file_uploader.rb') 


       template('plugin.js', 'app/assets/javascripts/tinymce/plugins/uploadimage/plugin.js') 
    end
    # def add_models
    #    template('attach.rb', 'app/models/attach.rb') 
    #    template('image.rb', 'app/models/image.rb') 
    # end

    def mount_engine
        route "mount TinymceFilemanager::Engine => '/filemanager'"
    end

    # def self.source_root
    #   @source_root ||= File.join(File.dirname(__FILE__), 'templates')
    # end

    # Generator Code. Remember this is just suped-up Thor so methods are executed in order
    # source_root File.expand_path("../../../", __FILE__)
    # desc "This generator installs Twitter Bootstrap to Asset Pipeline"

    # def add_lol
    #   #directory "assets", "vendor/assets"
    #   create_file "config/initializers/initializer11.rb", "# Add initialization content here"
    # end


  end
end