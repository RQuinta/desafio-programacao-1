module Challenge
  module V1
    module Entities
      class Item < Grape::Entity
        expose :id
        expose :description
        expose :price
      end
    end
  end
end
