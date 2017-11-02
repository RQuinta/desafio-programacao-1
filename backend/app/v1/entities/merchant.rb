module Challenge
  module V1
    module Entities
      class Merchant < Grape::Entity
        expose :id
        expose :name
      end
    end
  end
end
