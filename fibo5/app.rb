require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'model/calcular_arreglo'
require_relative 'model/arreglo_completo'
require_relative 'model/estructura'
require_relative 'model/crear_respuesta'
require "byebug"

get '/fibonacci/:numero/:S_L' do

  numero = params[:numero]
  suma_lista = params[:S_L]
  sentido = "sentido=#{params[:sentido]}"
  solo = "solo=#{params[:solo]}"

  arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero, sentido, solo);
  estructura = Estructura.devolver_estructura(arreglo_con_parametros, suma_lista)
  respuesta = EncargadoDeRespuesta.responder(numero, estructura)
  return respuesta.to_json();

end

get '/fibonacci/:numero' do
  begin
      numero = params[:numero].to_i
      sentido = "sentido=#{params[:sentido]}"
      solo = "solo=#{params[:solo]}"
      arreglo_con_parametros = ArregloCompleto.calcular_arreglo_completo(numero, sentido, solo);
      respuesta = EncargadoDeRespuesta.responder(numero, arreglo_con_parametros)
      return respuesta.to_json();
    rescue
      return "{error: Opciones no válidas}";
    end
end


=begin
No maneja errores (no devuelve nunca HTTP 400 con el JSON pedido)
Pocos tests funcionales
Todos los tests definidos en un único archivo
Toda la lógica resuelta con métodos de clase
Código muy poco claro, malos nombres, "if" sin código, etc.
Comportamiento de objetos del modelo basados en strings tomados directamente de la URL, 0 abstracción.
=end
