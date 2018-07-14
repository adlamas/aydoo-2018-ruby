
class ExcepcionInteresNegativo < Exception

  def initialize(msg="El interes siempre debe ser mayor a cero")
    super()
  end
end
