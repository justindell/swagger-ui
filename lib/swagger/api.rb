module Swagger
  class Api
    def initialize path, opts
      defaults = { 
        :path => path,
        :operations => []}
      @values = defaults.merge opts
    end

    def path
      @values[:path]
    end

    def operations http_methods, opts = {}
      operations = http_methods.map { |m| Operation.new self, m, opts }
      operations.each { |o| yield(o) }
      @values[:operations].concat operations
    end

    def as_json options
      @values.as_json options
    end
  end
end
