require_relative 'inversion'
require_relative '../excepciones/excepcion_diferencia_cotizaciones_invalida'

class CompraDolares < Inversion

  attr_accessor :cotizacion_inicial, :cotizacion_final

  def initialize(monto,cotizacion_inicial,cotizacion_final)
    super(monto)
    @cotizacion_inicial = cotizacion_inicial.round(4)
    @cotizacion_final = cotizacion_final.round(4)
  end

  def obtener_ganancia()
    monto_inicial_dolares = @monto / @cotizacion_inicial
    valor_dolares_inicialmente = monto_inicial_dolares * @cotizacion_inicial
    valor_dolares_finalmente = monto_inicial_dolares * @cotizacion_final

    return valor_dolares_finalmente - valor_dolares_inicialmente
  end

end
