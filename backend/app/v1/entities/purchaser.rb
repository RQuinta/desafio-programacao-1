module Challenge
  module V1
    module Entities
      class Purchaser < Grape::Entity
        expose :id
        expose :name
      end
    end
  end
end
