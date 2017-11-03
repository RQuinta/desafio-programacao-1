module Challenge
  module V1
    module Endpoints
      class Sells < Grape::API

        namespace :sells do

          desc 'Parse sells tab file'
          params do
            optional :file, type: File, desc: 'tab file'
          end
          post 'mass_edit' do
            binding.pry
            file_parser = SellsFileParser.new(params[:file])
            sells = file_parser.parse
            present(sells, with: Challenge::V1::Entities::Sell)
          end

        end

      end
    end
  end
end
