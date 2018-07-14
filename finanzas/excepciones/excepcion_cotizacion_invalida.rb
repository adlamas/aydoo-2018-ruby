
class ExcepcionCotizacionInvalida < Exception

  def initialize(msg="La cotizacion de los dolares siempre debe ser mayor a cero")
    super()
  end
end
