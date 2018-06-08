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

end
