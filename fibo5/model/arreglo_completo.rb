require 'sinatra'
require 'json'
require 'sinatra/json'
require_relative 'sentido'
require_relative 'solo'
require_relative 'calcular_arreglo'

class ArregloCompleto

  def self.calcular_arreglo_completo(numero, *parametros)
    begin
      arreglo_pasado = Array.new()
      arreglo_pasado = CalculoArreglo.calcular(numero)
      parametros.each do |parametro|
        array_parametros = parametro.split('=')
        if(array_parametros[1].nil? == false)
          nombre_de_clase_a_llamar = array_parametros[0].capitalize
          clase_a_llamar = Kernel.const_get(nombre_de_clase_a_llamar)
          metodo_a_llamar = clase_a_llamar.method(array_parametros[1]);
          arreglo_pasado = metodo_a_llamar.call(arreglo_pasado);
        end
      end
      return arreglo_pasado
    rescue
      halt 400, "{error: Opción no válida}"
    end
end

end
