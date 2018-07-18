require_relative 'plazo_fijo'

class ConstructorPlazoFijo

  def initialize()
  end

  def crear_inversion(parametros)
    monto = parametros[2]
    plazo = parametros[0]
    interes = parametros[1]
    plazo_fijo = PlazoFijo.new(plazo,interes,monto)
    return plazo_fijo
  end

end
