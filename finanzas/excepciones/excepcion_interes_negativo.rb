
class ExcepcionInteresNegativo < Exception

  def initialize(msg="El interes de cada plazo fijo siempre debe ser mayor a cero")
    puts msg
  end
end
