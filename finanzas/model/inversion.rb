require_relative '../excepciones/excepcion_monto_invalido'

class Inversion

  attr_accessor :monto

  def initialize(monto)
    @monto = monto.round(4)
  end

end
