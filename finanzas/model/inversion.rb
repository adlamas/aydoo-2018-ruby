require_relative '../excepciones/excepcion_monto_invalido'

class Inversion

  attr_accessor :monto

  def initialize(monto)
    if(monto < 0)
      raise ExcepcionMontoInvalido
    end
    @monto = monto.round(4)
  end

end
