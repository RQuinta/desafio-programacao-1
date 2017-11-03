require 'spec_helper'

describe 'Protected Resources' do
  let(:application) { Application.create(name: 'App1') }
  let(:user) { User.create(username: 'Jack Sparrow', password: '12345678') }

  context 'protected endpoints' do

    it 'Upload tab file with valid token' do
      access_token = AccessToken.create_for(application, user, 'read write')

      file_path = 'test.tab'

      File.open(file_path, 'w') do |f|
        f.puts ["purchaser name",	"item description",	"item price",	"purchase count",	"merchant address", "merchant name"].join("\t")
        f.puts ["João Silva",	"R$10 off R$20 of food",	10.0,	987, "Fake St",	"Bob's Pizza"].join("\t")
      end

      post 'api/v1/sells/mass_edit', file: Rack::Test::UploadedFile.new(file_path, 'image/jpeg'), access_token: access_token.token
      File.delete(file_path)

      expect(last_response.status).to eq 201
    end

    it 'Upload tab file with invalid token' do
      access_token = AccessToken.create_for(application, user, 'read write')

      file_path = 'test.tab'

      require 'csv'

      File.open(file_path, 'w') do |f|
        f.puts ["purchaser name",	"item description",	"item price",	"purchase count",	"merchant address", "merchant name"].join("\t")
        f.puts ["João Silva",	"R$10 off R$20 of food",	10.0,	987, "Fake St",	"Bob's Pizza"].join("\t")
      end

      post 'api/v1/sells/mass_edit', file: Rack::Test::UploadedFile.new(file_path, 'image/jpeg'), access_token: access_token.token

      expect(last_response.status).to eq 201
    end
  end
end
