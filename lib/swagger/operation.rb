module Swagger
  class Operation
    include ActionView::Helpers::TextHelper
    HTTP_METHODS = ["GET","POST","PUT","DELETE"]
    ALLOWABLE_VALUES_VALUE_TYPES = ["LIST", "RANGE"]
    CONTAINERS = ['List', 'Set', 'Array']
    PRIMITIVES = ['byte', 'boolean', 'int', 'long', 'float', 'double', 'string', 'Date']
    PARAM_TYPES = {
      'body' => {:types => ['complex', 'container'], 
                 :allowMultipleAllowed => false},
      'path' => {:types => PRIMITIVES, 
                 :allowMultipleAllowed => false},
      'query' => {:types => PRIMITIVES, 
                  :allowMultipleAllowed => true},
      'header' => {:types => PRIMITIVES, 
                   :allowMultipleAllowed => false}
    } 

    def initialize api, http_method, opts = {}
      bomb("#{http_method} not valid. httpMethod must be one of: #{HTTP_METHODS}") unless HTTP_METHODS.include?(http_method)
      defaults = {
        :nickname => api.path.split('/').last,
        :httpMethod => http_method,
        :parameters => [],
        :summary => ""
      }
      values = defaults.merge opts
      values[:notes] = simple_format(values[:notes]) if values[:notes]
      @values = values
    end

    def param name, opts = {}
      defaults = {
        :name => name,
        :description => name,
        :required => false,
        :allowMultiple => false,
        :dataType => "string",
        :paramType =>  "query"
      }
      if list = opts.delete(:list)
        defaults.merge!(:allowableValues => {:values => list,
                                             :valueType => "LIST"})
      end
      if range = opts.delete(:range)
        defaults.merge!(:allowableValues => {:min => range.first,
                                             :max => range.last,
                                             :valueType => "RANGE"})
      end
      result = defaults.merge(opts)
      bomb("#{result[:dataType]} not valid. dataType must be one of #{PRIMITIVES.inspect}") unless PRIMITIVES.include?(result[:dataType])
      bomb("#{result[:paramType]} not valid. paramType must be one of #{PARAM_TYPES.keys.inspect}") unless PARAM_TYPES.keys.include?(result[:paramType])
      bomb("allowMultiple not allowed for paramType #{result[:paramType]}") if result[:allowMultiple] && !PARAM_TYPES[result[:paramType]][:allowMultipleAllowed]
      @values[:parameters] << result
    end

    def as_json options
      @values.as_json options
    end
  end
end
