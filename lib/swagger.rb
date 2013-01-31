require 'rubygems'
require 'action_view'
require "swagger/version"
require 'swagger/document'
require 'swagger/api'
require 'swagger/operation'

module Swagger
  def document base_path, opts = {}
    d = Document.new(base_path, opts).tap { |d| yield(d) }
    render :json => d
  end
end
