require_relative 'sentido'
require_relative 'solo'

class ArregloCompleto

  def self.calcular_arreglo_completo(arreglo, *parametros)
      arreglo_pasado = arreglo
      parametros.each do |parametro|
        if(parametro.nil? == false)
          array_parametro = parametro.split('=')
          if(array_parametro[0] == 'sentido')
            arreglo_pasado = Sentido.dar_sentido_al_arreglo(arreglo_pasado, array_parametro[1])
          elsif(array_parametro[0] == 'solo')
            arreglo_pasado = Solo.solo_estos_valores(arreglo_pasado, array_parametro[1])
          end
        end
      end

      return arreglo_pasado
  end

end
