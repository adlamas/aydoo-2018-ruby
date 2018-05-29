require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'model/calcular_arreglo'
require_relative 'model/arreglo_completo'

def require_all(_dir)
    Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/**/*.rb"].each do |file|
        require file
    end
end

get '/fibonacci/:N' do

  numero = params[:N].to_i
  sentido = params[:sentido]
  solo = params[:solo]
  arreglo = CalculoArreglo.calcular(numero)
  #arreglo_final = ArregloCompleto.calcular_arreglo_completo(arreglo, sentido, solo)

  json(fibonacci: { limite: numero, lista: arreglo })
end

get '/fibonacci/:N/:S_L' do
  #arreglo = ["#{params[:N]}","#{params[:L]}", params[:solo], params[:sentido]]
  numero = params[:N]
  suma_lista =  params[:S_L]
  sentido = params[:sentido]
  solo = params[:solo]
  arreglo_de_parametros = [numero, suma_lista, sentido, solo]
  return arreglo_de_parametros.to_json();
end
