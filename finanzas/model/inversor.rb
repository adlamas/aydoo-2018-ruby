
class Inversor

  attr_accessor :inversion, :ganancias
  def initialize()
    @inversion = nil
    @ganancias = 0
  end

  def invertir(inversion)
    @inversion = inversion
  end

  def recaudar_ganancias()
    @ganancias = @inversion.obtener_ganancia
  end
end
