# Swagger

Rails wrapper for the [Swagger-UI](https://github.com/wordnik/swagger-ui, 'Swagger') API

## Installation

Add this line to your application's Gemfile:

    gem 'swagger-ui', :require => 'swagger'

And then execute:

    $ bundle

Then run the generator:

    $ rails generate swagger:install

## Usage

Check out index.html.haml in the examples for basic setup. A docs controller and routes will also be required. Fill out the api in the docs controller. Example:

    class Api::DocsController < Api::ApiController
      include Swagger

      def index
        document = {
          "swaggerVersion" => "1.1",
          "basePath" => api_docs_url,
          "apis" => [
            {"path" => "/foo",
             "description" => ""}]
        }
        render :json => document
      end

      def foo
        document(api_url, :resourcePath => 'foos') do |doc|
          doc.api('/foos') do |api|
            api.operations(['GET','POST']) do |op|
              op.param('param', :required => true)
            end
          end
        end
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
