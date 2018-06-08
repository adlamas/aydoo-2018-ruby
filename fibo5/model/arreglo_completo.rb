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
        array_parametro = parametro.split('=')
        if(array_parametro[1].nil? == false)
          if(array_parametro[0] == 'sentido')
            arreglo_pasado = Sentido.dar_sentido_al_arreglo(arreglo_pasado, array_parametro[1])
          elsif(array_parametro[0] == 'solo')
            arreglo_pasado = Solo.solo_estos_valores(arreglo_pasado, array_parametro[1])
          else
            halt 400, "{error: Opciones no válidas}"
          end
        end
      end
    return arreglo_pasado
  end
rescue Exception => e
  halt 400, "{error: Opciones no válidas}"
end

end
