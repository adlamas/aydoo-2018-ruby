
class ExcepcionMontoInvalido < Exception

  def initialize(msg="El monto de cada inversion siempre debe ser mayor a cero")
    puts msg
  end
end
