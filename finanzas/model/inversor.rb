
class Inversor

  attr_accessor :inversion, :ganancias, :tipo
  attr_reader :posibles_tipos


  def initialize(tipo)
    @inversion = nil
    @ganancias = 0
    @posibles_tipos = {"emp" => "empresa", "ind" => "individuo"}
    @tipo = posibles_tipos[tipo]
  end

  def invertir(inversion)
    @inversion = inversion
  end

  def recaudar_ganancias()
    @ganancias = @inversion.obtener_ganancia
  end
end
