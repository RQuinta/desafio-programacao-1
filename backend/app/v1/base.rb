module Challenge
  module V1
    class Base < ::Grape::API
      version 'v1', using: :path

      mount ::Challenge::V1::Endpoints::Sells
      mount ::Challenge::V1::Endpoints::Users

      desc 'Information about current resource owner'

      get '/me' do
        access_token_required!

        present(current_resource_owner, with: Entities::User)
      end


    end
  end
end
