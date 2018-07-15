
class ExcepcionPlazoInvalido < Exception

  def initialize(msg="El plazo siempre debe ser mayor a cero")
    puts msg
  end
end
