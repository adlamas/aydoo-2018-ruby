require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'model/calcular_arreglo'
require_relative 'model/arreglo_completo'
require "byebug"
require_relative 'model/sentido'
require_relative 'model/solo'

get '/fibonacci/:numero' do

  numero = params[:numero]
  #return numero;
  numero = CalculoArreglo.calcular(numero);

  puts numero;
  return numero;

  #arreglo_final = ArregloCompleto.calcular_arreglo_completo(arreglo, sentido, solo)
  #json(fibonacci: { limite: numero, lista: arreglo_final })
end
=begin

get '/fibonacci/:N/:S_L' do
  #arreglo = ["#{params[:N]}","#{params[:L]}", params[:solo], params[:sentido]]
  numero = params[:N]
  suma_lista = params[:S_L]
  sentido = params[:sentido]
  solo = params[:solo]
  arreglo_de_parametros = [numero, suma_lista, sentido, solo]
  return arreglo_de_parametros.to_json();
end

=end
