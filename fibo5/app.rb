require 'sinatra'
require 'json'
require_relative 'model/calcular_arreglo'

get '/fibonacci/:N' do

  numero = "#{params[:N]}".to_i
  calculo = CalculoArreglo.new()
  arreglo = calculo.calcular(numero)
  arreglo2 = {'lista' => arreglo}

  return arreglo2.to_json();
end
