module Challenge
  module V1
    module Entities
      class User < Grape::Entity
        expose :id
        expose :username
      end
    end
  end
end
