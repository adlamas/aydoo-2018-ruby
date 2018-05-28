require_relative '../app'
require 'rspec'
require 'rack/test'

describe "Aplicacion fibo5" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "raiz" do
    it 'deberia devolver un arreglo' do
      get "/fibonacci/4"

      expect(last_response).to be_ok
      expect(last_response.body).to eq "4"

    end
  end

end
