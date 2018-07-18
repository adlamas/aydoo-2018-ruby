require_relative 'plazo_fijo_precancelable'

class ConstructorPlazoFijoPrecancelable

  def initialize()
  end

  def crear_inversion(parametros)
    monto = parametros[3]
    plazo_inicial = parametros[0]
    plazo_real = parametros[1]
    interes = parametros[2]
    plazo_fijo_precancelable = PlazoFijoPrecancelable.new(plazo_inicial, plazo_real,interes,monto)
    return plazo_fijo_precancelable
  end

end
