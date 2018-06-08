require_relative '../app'
require 'rspec'
require 'rack/test'
require_relative '../model/arreglo_completo'
require_relative '../model/sentido'
require_relative '../model/solo'
require_relative '../model/estructura'

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

  describe "test solo_estos_valores" do
    it "el metodo solo_estos_valores deberia dar correctamente" do
      arreglo_8 = [0,1,1,2,3,5,8,13]
      arreglo_10 = [0,1,1,2,3,5,8,13,21,34]

      arreglo_nuevo_8 = Solo.solo_estos_valores(arreglo_8, "impares")
      arreglo_nuevo_10 = Solo.solo_estos_valores(arreglo_10, "pares")

      expect(arreglo_nuevo_8).to eq [1,1,3,5,13]
      expect(arreglo_nuevo_10).to eq [2,8,34]
    end
  end

  describe "calcular arreglo con sentido y solo " do
    it "calcular arreglo completo con sentido y solo" do
      arreglo_final = ArregloCompleto.calcular_arreglo_completo(8, "sentido=inverso", "solo=impares");

      expect(arreglo_final).to eq [13,5,3,1,1];
    end

  end

  describe "calcular arreglo con sentido y solo 2 " do
    it "calcular arreglo completo con sentido y solo 2" do
      arreglo_final = ArregloCompleto.calcular_arreglo_completo(8, "sentido=directo", "solo=impares");

      expect(arreglo_final).to eq [1,1,3,5,13];
    end

  end

  describe "calcular el arreglo sin sentido y con solo" do
    it "calcular arreglo completo sin sentido y con solo" do
      arreglo_final = ArregloCompleto.calcular_arreglo_completo(8, "solo=impares");

      expect(arreglo_final).to eq [1,1,3,5,13];
    end

  end

  describe "calcular el arreglo con sentido inverso" do
    it "calcular arreglo completo con sentido inverso" do
      arreglo_final = ArregloCompleto.calcular_arreglo_completo(8, "sentido=inverso");

      expect(arreglo_final).to eq [13,8,5,3,2,1,1,0];
    end

  end

  describe "calcular el arreglo con sentido directo" do
    it "calcular arreglo completo con sentido directo" do
      arreglo_final = ArregloCompleto.calcular_arreglo_completo(8, "sentido=directo");

      expect(arreglo_final).to eq [0,1,1,2,3,5,8,13];
    end

  end

  describe "calcular el arreglo mediante un numero" do
    it "calcular arreglo" do
      numero = 8
      arreglo = CalculoArreglo.calcular(numero)

      expect(arreglo).to eq [0,1,1,2,3,5,8,13]

    end
  end

  describe "sumar arreglo" do
    it "deberia sumar el arreglo que le paso" do
      arreglo = [0,1,1,2,3,5];
      arreglo2 = [0,1,1,2,3,5,8,13];
      arreglo3 = [0,1,1,2,3,5,8,13,21,34];

      suma1 = Estructura.sumar(arreglo);
      suma2 = Estructura.sumar(arreglo2);
      suma3 = Estructura.sumar(arreglo3);

      expect(suma1).to eq 12
      expect(suma2).to eq 33
      expect(suma3).to eq 88

    end
  end

end
