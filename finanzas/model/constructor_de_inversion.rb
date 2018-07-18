require_relative 'inversion'

require_relative 'constructor_compra_dolares'
require_relative 'constructor_plazo_fijo'
require_relative 'constructor_plazo_fijo_precancelable'

class ConstructorDeInversion

  attr_accessor :constructor_plazo_fijo, :constructor_compra_dolares, :constructor_plazo_fijo_precancelable
  def initialize
    @constructor_compra_dolares = ConstructorCompraDolares.new()
    @constructor_plazo_fijo = ConstructorPlazoFijo.new()
    @constructor_plazo_fijo_precancelable = ConstructorPlazoFijoPrecancelable.new()
  end

  def construir_inversion(parametros_inversion)
    arreglo = parametros_inversion.split(',')
    tipo_de_inversion = arreglo[0]
    arreglo_de_parametros = construir_parametros_para_inversion(arreglo)
    hash_de_inversiones =
    {
      'dol' => @constructor_compra_dolares,
      'pft' => @constructor_plazo_fijo,
      'pfp' => @constructor_plazo_fijo_precancelable
    }
    if(!hash_de_inversiones.include?(tipo_de_inversion))
      raise ExcepcionInversionNoExistente
    end
    inversion_a_devolver = hash_de_inversiones[tipo_de_inversion].crear_inversion(arreglo_de_parametros)
    return inversion_a_devolver
  end

  def construir_parametros_para_inversion(arreglo)
    arreglo_de_parametros = Array.new()
    for i in (1...arreglo.length)
      arreglo_de_parametros.push(arreglo[i].to_f)
    end
    return arreglo_de_parametros
  end


end
