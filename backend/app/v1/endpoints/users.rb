module Challenge
  module V1
    module Endpoints
      class Users < Grape::API
        namespace :users do
          desc 'Create user'
          params do
            requires :name, type: String, desc: 'name'
            requires :username, type: String, desc: 'username'
            requires :password, type: String, desc: 'password'
          end
          post '/' do
            user = User.create params
            present(user, with: Challenge::V1::Entities::User)
          end
        end
      end
    end
  end
end
