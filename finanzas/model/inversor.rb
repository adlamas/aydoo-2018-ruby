
class Inversor

  attr_accessor :inversion
  def initialize()
    @inversion = nil
  end

  def invertir(inversion)
    @inversion = inversion
  end

  def obtener_ganancias()
    return @inversion.obtener_ganancia
  end
end
