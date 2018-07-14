
class ExcepcionMontoInvalido < Exception

  def initialize(msg="El monto de la inversion siempre debe ser mayor a cero")
    super()
  end
end
