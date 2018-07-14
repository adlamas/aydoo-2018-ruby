require_relative '../excepciones/excepcion_tipo_inversor_invalido'

class Inversor

  attr_accessor :inversion, :ganancias_brutas, :ganancias_netas, :tipo
  attr_reader :posibles_tipos

  def initialize(tipo)
    @inversion = nil
    @ganancias_brutas = 0
    @ganancias_netas = 0
    @posibles_tipos = {"emp" => "empresa", "ind" => "individuo"}
    @tipo = posibles_tipos[tipo]
  end

  def invertir(inversion)
    @inversion = inversion
  end

  def recaudar_ganancias_brutas()
    @ganancias_brutas = @inversion.obtener_ganancia
  end
end
