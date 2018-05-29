require_relative '../app'
require 'rspec'
require 'rack/test'
require_relative '../model/arreglo_completo'
require_relative '../model/sentido'
require_relative '../model/solo'

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

  describe "test split" do
    it "el split debe convertir los parametros  en 2 strings" do
      cadena = "solo=pares";
      arreglo_cadena = cadena.split("=");
      expect(arreglo_cadena[0]).to eq "solo";
      expect(arreglo_cadena[1]).to eq "pares";

    end
  end

  describe "invertir arreglo" do
    it "deberia devolver el arreglo invertido" do
      arreglo_8 = [0,1,1,2,3,5,8,13]
      arreglo_5 = [0,1,1,2,3]
      arreglo_7 = [0,1,1,2,3,5,8]
      sentido = "inverso"
      arreglo_nuevo_8 = Sentido.dar_sentido_al_arreglo(arreglo_8, sentido)
      arreglo_nuevo_5 = Sentido.dar_sentido_al_arreglo(arreglo_5, sentido)
      arreglo_nuevo_7 = Sentido.dar_sentido_al_arreglo(arreglo_7, sentido)

      expect(arreglo_nuevo_8).to eq [13,8,5,3,2,1,1,0]
      expect(arreglo_nuevo_5).to eq [3,2,1,1,0]
      expect(arreglo_nuevo_7).to eq [8,5,3,2,1,1,0]

    end

  end

  describe "devolver solo valores pares" do
    it "deberia devolver solo los pares de un arreglo" do
      arreglo_8 = [0,1,1,2,3,5,8,13]
      arreglo_5 = [0,1,1,2,3]

      arreglo_nuevo_8 = Solo.solo_valores_pares(arreglo_8)
      arreglo_nuevo_5 = Solo.solo_valores_pares(arreglo_5)

      expect(arreglo_nuevo_8).to eq [2,8]
      expect(arreglo_nuevo_5).to eq [2]
    end
  end

  describe "devolver solo valores impares" do
    it "deberia devolver solo los impares de un arreglo" do
      arreglo_8 = [0,1,1,2,3,5,8,13]
      arreglo_5 = [0,1,1,2,3]

      arreglo_nuevo_8 = Solo.solo_valores_impares(arreglo_8)
      arreglo_nuevo_5 = Solo.solo_valores_impares(arreglo_5)

      expect(arreglo_nuevo_8).to eq [1,1,3,5,13]
      expect(arreglo_nuevo_5).to eq [1,1,3]
    end
  end

end
