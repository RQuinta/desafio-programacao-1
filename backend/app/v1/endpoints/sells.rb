require 'pry-byebug'
module Challenge
  module V1
    module Endpoints
      class Sells < Grape::API

        namespace :sells do

          desc 'Parse sells tab file'
          params do
            requires :file, type: File, desc: 'tab file'
          end
          post 'mass_edit' do
            file = params[:file]
            temp_file = file[:tempfile]
            file_parser = SellsFileParser.new(temp_file)
            sells = file_parser.parse
            present(sells, with: Challenge::V1::Entities::Sell)
          end

        end

      end
    end
  end
end
