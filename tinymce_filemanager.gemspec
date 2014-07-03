$:.push File.expand_path("../lib", __FILE__)


require "tinymce_filemanager/version"


Gem::Specification.new do |s|
  s.name        = "tinymce_filemanager"
  s.version     = TinymceFilemanager::VERSION
  s.authors     = "Alexandr Shum"
  s.email       = "schumi@live.ru"
  s.homepage    = "http://web-malina.kz"
  s.summary     = "tinymce_filemanager"
  s.description = "tinymce_filemanager"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"
  s.add_runtime_dependency 'haml-rails'
  s.add_runtime_dependency 'carrierwave'
  s.add_runtime_dependency 'mini_magick'
  s.add_runtime_dependency 'angularjs-rails'
  s.add_runtime_dependency 'ng-rails-csrf'
  s.add_runtime_dependency 'underscore-rails'
  s.add_runtime_dependency 'bootstrap-sass'
  s.add_runtime_dependency 'coffee-rails'
  s.add_runtime_dependency 'compass-rails'

  s.add_development_dependency "sqlite3"
end
