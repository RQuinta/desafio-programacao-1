module Challenge
  module V1
    module Entities
      class Purchaser < Grape::Entity
        expose :id
        format_with(:name) do |name|
          name
        end
      end
    end
  end
end
