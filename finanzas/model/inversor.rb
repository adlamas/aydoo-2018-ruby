require_relative '../excepciones/excepcion_tipo_inversor_invalido'

class Inversor

  attr_accessor :inversion, :ganancias_brutas, :ganancias_netas, :tipo
  attr_reader :posibles_tipos

  def initialize(tipo)
    @inversion = nil
    @ganancias_brutas = 0
    @ganancias_netas = 0
    @posibles_tipos = {"emp" => "empresa", "ind" => "individuo"}
    if(!@posibles_tipos.has_key?(tipo))
      raise ExcepcionTipoInversorInvalido
    end
    @tipo = posibles_tipos[tipo]
  end

  def invertir(inversion)
    @inversion = inversion
  end

  def recaudar_ganancias_brutas()
    @ganancias_brutas = @inversion.obtener_ganancia()
  end

  def obtener_porcentaje_de_impuesto_a_ganancia_bruta()
    return inversion.impuesto.calcular_tasa(self, @ganancias_brutas)
  end
end
