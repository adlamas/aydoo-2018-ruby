require_relative 'inversion'

class CompraDolares < Inversion

  attr_accessor :cotizacion_inicial, :cotizacion_final

  def initialize(monto,cotizacion_inicial,cotizacion_final)
    super(monto)
    @cotizacion_inicial = cotizacion_inicial.round(4)
    @cotizacion_final = cotizacion_final.round(4)
  end

end
