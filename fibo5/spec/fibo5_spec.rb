require_relative '../app'
require 'rspec'
require 'rack/test'
require_relative '../model/arreglo_completo'

describe "Aplicacion fibo5" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "devolver arreglo fibo" do
    it "deberia devolver el arreglo fibo con solo un numero" do
      get "/fibonacci/4"

      expect(last_response).to be_ok
      expect(last_response.body).to eq '{"fibonacci":{"limite":4,"lista":[0,1,1,2]}}'

    end
  end

  describe "como se pasan los parametros" do
    it "los parametros opcionales deberian pasarse como un arreglo" do

      arreglo = ArregloCompleto.calcular_arreglo_completo([1,2,3,4], "hola", "pedro")

      expect(arreglo.class).to eq Array;
      expect(arreglo).to eq ["hola", "pedro"];

    end

  end

end
