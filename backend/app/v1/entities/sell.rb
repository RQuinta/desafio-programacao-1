module Challenge
  module V1
    module Entities
      class Sell < Grape::Entity
        expose :id
        # expose :user, using: Challenge::V1::Entities::User
        # expose :merchant, using: Challenge::API::Entities::Merchant
        # expose :item, using: Challenge::V1::Entities::Item
        # expose :purchaser, using: Challenge::API::Entities::Purchaser
      end
    end
  end
end
