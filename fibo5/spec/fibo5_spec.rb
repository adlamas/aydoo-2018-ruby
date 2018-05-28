require_relative '../app'
require 'rspec'
require 'rack/test'

describe "Aplicacion fibo5" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "devolver arreglo fibo" do
    it "deberia devolver el arreglo fibo con solo un numero" do
      get "/fibonacci/4"

      expect(last_response).to be_ok
      expect(last_response.body).to eq '{"lista":[0,1,1,2]}'

    end
  end

end
