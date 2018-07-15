require_relative '../excepciones/excepcion_monto_invalido'
require_relative 'impuesto'

class Inversion

  attr_accessor :monto, :impuesto

  def initialize(monto)
    if(monto < 0)
      raise ExcepcionMontoInvalido
    end
    @monto = monto.round(4)
    @impuesto = Impuesto.new()
  end

  def agregar_impuesto(impuesto)
    #@impuesto = impuesto
  end

  def obtener_impuesto_a_ganancia_de_inversion(inversor)
    tasa = impuesto.calcular_tasa(inversor, inversor.ganancias_brutas)
    return tasa
  end

end
