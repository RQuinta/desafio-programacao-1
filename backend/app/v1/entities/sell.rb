require 'pry-byebug'
module Challenge
  module V1
    module Entities
      class Sell < Grape::Entity
        expose :id
        expose :merchant, :using => "Challenge::V1::Entities::Merchant"
        expose :item, :using => "Challenge::V1::Entities::Item"
        expose :purchaser, :using => "Challenge::V1::Entities::Purchaser"
      end
    end
  end
end
