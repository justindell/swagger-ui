module Swagger
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../../', __FILE__)

    def copy_files
      template 'public/stylesheets/swagger.css', 'public/stylesheets/swagger.css'
      template 'public/javascripts/swagger.js',  'public/javascripts/swagger.js'
    end
  end
end
