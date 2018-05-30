require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'model/calcular_arreglo'
require_relative 'model/arreglo_completo'
require_relative 'model/sumatoria'
require "byebug"


get '/fibonacci/:numero' do

  numero = params[:numero]
  sentido = "sentido=#{params[:sentido]}"
  solo = "solo=#{params[:solo]}"

  arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero, sentido, solo);
  respuesta = json(fibonacci: { limite: params[:numero].to_i, lista: arreglo_con_parametros })
  return respuesta;

end

get '/fibonacci/:numero/:S_L' do

  numero = params[:numero]
  suma_lista = params[:S_L]
  sentido = params[:sentido]
  solo = params[:solo]

  arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero, sentido, solo);
  respuesta = json(fibonacci: { limite: params[:numero].to_i, lista: arreglo_con_parametros })

  if(suma_lista == "sumatoria")
    suma = Sumatoria.sumar(arreglo_con_parametros)
    respuesta = json(fibonacci: { limite: params[:numero].to_i, suma: suma })
  end

  return respuesta;

end
