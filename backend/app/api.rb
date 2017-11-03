require 'grape-swagger'
module Challenge
  class API < ::Grape::API
    format :json
    prefix :api

    include Grape::OAuth2.api

    desc 'Root action'

    get '/' do
      { error: ['Please check API documentation'] }
    end

    mount ::Challenge::V1::Base
    add_swagger_documentation
  end
end
