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

  describe "probar ruta con numero" do
    it "fibonacci/8" do
        get 'fibonacci/8';
        expect(last_response).to be_ok;
        expect(last_response.body).to eq '{"fibonacci":{"limite":8,"lista":[0,1,1,2,3,5,8,13]}}'
    end
  end

  describe "probar ruta con numero 6 y sentido inverso" do
    it "fibonacci/6?sentido=inverso" do
      get 'fibonacci/6?sentido=inverso';
      expect(last_response).to be_ok;
      expect(last_response.body).to eq '{"fibonacci":{"limite":6,"lista":[5,3,2,1,1,0]}}'
    end
  end

  describe "probar ruta con 13, sentido directo y solo pares" do
    it "/fibonacci/13?sentido=inverso&solo=pares" do
      get 'fibonacci/13?sentido=inverso&solo=pares';
      expect(last_response).to be_ok;
      expect(last_response.body).to eq '{"fibonacci":{"limite":13,"lista":[144,34,8,2]}}'
    end
  end

  describe "probar ruta 8, solo impares y sentido inverso" do
    it "/fibonacci/8?solo=impares&sentido=inverso" do
      get 'fibonacci/8?solo=impares&sentido=inverso';
      expect(last_response).to be_ok;
      expect(last_response.body).to eq '{"fibonacci":{"limite":8,"lista":[13,5,3,1,1]}}'
    end
  end

  describe "error en la ruta /8?sentido=sarasa" do
    it "/8?sentido=sarasa" do
      get 'fibonacci/8?sentido=sarasa';
      expect(last_response.body).to eq '{error: Opción no válida}'
    end
  end

  describe "error en la ruta /8?solo=sarasa" do
    it "/8?solo=sarasa" do
      get 'fibonacci/8?solo=sarasa';
      expect(last_response.body).to eq '{error: Opción no válida}'
    end
  end

  describe "ruta /8/lista" do
    it "/8/lista" do
      get 'fibonacci/8/lista';
      expect(last_response.body).to eq '{"fibonacci":{"limite":"8","lista":[0,1,1,2,3,5,8,13]}}'
    end
  end

  describe "ruta /5/sumatoria" do
    it "/5/sumatoria" do
      get 'fibonacci/5/sumatoria';
      expect(last_response.body).to eq '{"fibonacci":{"limite":"5","sumatoria":7}}'
    end
  end

  describe "ruta /5/lista?sentido=inverso" do
    it "/5/lista?sentido=inverso" do
      get 'fibonacci/5/lista?sentido=inverso';
      expect(last_response.body).to eq '{"fibonacci":{"limite":"5","lista":[3,2,1,1,0]}}'
    end
  end

  describe "ruta /8/sumatoria?solo=impares" do
    it "/8/sumatoria?sentido=inverso" do
      get 'fibonacci/8/sumatoria?sentido=inverso';
      expect(last_response.body).to eq '{"fibonacci":{"limite":"8","sumatoria":33}}'
    end
  end

  describe "ruta /9/sumatoria?solo=pares&sentido=inverso" do
    it "/9/sumatoria?solo=pares&sentido=inverso" do
      get 'fibonacci/9/sumatoria?solo=pares&sentido=inverso';
      expect(last_response.body).to eq '{"fibonacci":{"limite":"9","sumatoria":10}}';
    end
  end

end
