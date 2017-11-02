module Challenge
  module V1
    module Entities
      class Item < Grape::Entity
        expose :id
        expose :description
      end
    end
  end
end
