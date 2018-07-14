
class ExcepcionDiferenciaDeCotizacionesInvalida < Exception

  def initialize(msg="La cotizacion final debe ser mayor a la inicial")
    super()
  end
end
