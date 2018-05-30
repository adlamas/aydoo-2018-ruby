require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'model/calcular_arreglo'
require_relative 'model/arreglo_completo'
require "byebug"


get '/fibonacci/:numero' do

  numero = params[:numero]
  sentido = "sentido=#{params[:sentido]}"
  solo = "solo=#{params[:solo]}"

  arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero, sentido, solo);
  return json(fibonacci: { limite: params[:numero].to_i, lista: arreglo_con_parametros })

end


get '/fibonacci/:N/:S_L' do

  numero = params[:N]
  suma_lista = "suma_lista=#{params[:S_L]}"
  sentido = params[:sentido]
  solo = params[:solo]

  arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero,suma_lista, sentido, solo);
  return json(fibonacci: { limite: params[:numero].to_i, lista: arreglo_con_parametros })
end
