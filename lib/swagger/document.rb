module Swagger
  class Document
    def initialize base_path, opts = {}
      defaults = {
        :swaggerVersion => "1.1",
        :basePath => base_path,
        :apis => [],
      }
      @values = defaults.merge opts
    end

    def api path, opts = {}
      a = Api.new(path, opts)
      yield(a)
      @values[:apis] << a
      a
    end

    def as_json options
      @values.as_json options
    end
  end
end
