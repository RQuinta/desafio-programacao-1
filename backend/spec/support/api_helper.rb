module ApiHelper
  include Rack::Test::Methods

  def app
    Challenge::API
  end

  def json_body
    JSON.parse(last_response.body, symbolize_names: true) rescue fail StandardError, 'API request returned invalid json'
  end
end
