module Challenge
  module V1
    module Entities
      class Merchant < Grape::Entity
        expose :id
        expose :name
        expose :address
      end
    end
  end
end
