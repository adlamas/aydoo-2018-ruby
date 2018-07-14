
class ExcepcionDiferenciaDePlazosInvalida < Exception

  def initialize(msg="El plazo real del plazo fijo precancelable siempre debe ser menor o igual al plazo inicial")
    super()
  end
end
