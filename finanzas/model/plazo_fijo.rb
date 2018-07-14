require_relative 'inversion'
require_relative '../excepciones/excepcion_interes_negativo'
require_relative '../excepciones/excepcion_plazo_invalido'


class PlazoFijo < Inversion

  attr_accessor :plazo, :interes

  def initialize(plazo,interes,monto)
    super(monto)
    @plazo = plazo
    @interes = interes.round(4)

    if(@interes < 0)
      raise ExcepcionInteresNegativo
    end

    if(@plazo <= 0)
      raise ExcepcionPlazoInvalido
    end
  end

  def obtener_interes_por_dias_de_plazo()
    porcentaje_de_anio = (365.0/@plazo)
    porcentaje_de_interes_por_dias = 100.0/porcentaje_de_anio
    interes_final_a_cobrar = ((porcentaje_de_interes_por_dias*@interes)/100.0 ).round(4)

    return interes_final_a_cobrar
  end

  def obtener_ganancia()
    return ((obtener_interes_por_dias_de_plazo() * @monto)/100)
  end

end
