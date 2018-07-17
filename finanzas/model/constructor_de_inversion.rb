require_relative 'inversion'
require_relative 'compra_dolares'
require_relative 'plazo_fijo'
require_relative 'plazo_fijo_precancelable'

class ConstructorDeInversion

  def initialize
  end

  def construir_inversion(parametros_inversion)
    arreglo = parametros_inversion.split(',')
    tipo_de_inversion = arreglo[0]
    arreglo_de_parametros = construir_parametros_para_inversion(arreglo)
    hash_de_inversiones =
    {
      'dol' => 'inversion_compra_dolares',
      'pft' => 'inversion_plazo_fijo',
      'pfp' => 'inversion_plazo_fijo_precancelable'
    }
    if(!hash_de_inversiones.include?(tipo_de_inversion))
      raise ExcepcionInversionNoExistente
    end
    inversion_a_devolver = send(hash_de_inversiones[tipo_de_inversion], arreglo_de_parametros)
    return inversion_a_devolver
  end

  def construir_parametros_para_inversion(arreglo)
    arreglo_de_parametros = Array.new()
    for i in (1...arreglo.length)
      arreglo_de_parametros.push(arreglo[i].to_f)
    end
    return arreglo_de_parametros
  end

  def inversion_compra_dolares(parametros)
    monto = parametros[0]
    cot_ini = parametros[1]
    cot_fin = parametros[2]
    compra_dolares = CompraDolares.new(monto,cot_ini,cot_fin)
    return compra_dolares
  end

  def inversion_plazo_fijo(parametros)
    monto = parametros[2]
    plazo = parametros[0]
    interes = parametros[1]
    plazo_fijo = PlazoFijo.new(plazo,interes,monto)
    return plazo_fijo
  end

  def inversion_plazo_fijo_precancelable(parametros)
    monto = parametros[3]
    plazo_inicial = parametros[0]
    plazo_real = parametros[1]
    interes = parametros[2]
    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(plazo_inicial, plazo_real,interes,monto)
    return plazo_fijo_precancelable
  end

end
