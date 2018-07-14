require_relative 'inversion'
require_relative '../excepciones/excepcion_cotizacion_invalida'
require_relative '../excepciones/excepcion_diferencia_cotizaciones_invalida'

class CompraDolares < Inversion

  attr_accessor :cotizacion_inicial, :cotizacion_final

  def initialize(monto,cotizacion_inicial,cotizacion_final)
    super(monto)
    @cotizacion_inicial = cotizacion_inicial.round(4)
    @cotizacion_final = cotizacion_final.round(4)
  end

  def obtener_ganancia()
    monto_inicial = @monto * @cotizacion_inicial
    monto_final = @monto * @cotizacion_final

    return monto_final - monto_inicial
  end

end
