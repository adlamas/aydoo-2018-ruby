require_relative '../excepciones/excepcion_tipo_inversor_invalido'

class Inversor

  attr_accessor :inversion, :ganancias_brutas, :ganancias_netas, :tipo
  attr_reader :posibles_tipos

  def initialize(tipo)
    @inversiones = Array.new()
    @ganancias_brutas = 0
    @ganancias_netas = 0
    @posibles_tipos = {"emp" => "empresa", "ind" => "individuo"}
    if(!@posibles_tipos.has_key?(tipo))
      raise ExcepcionTipoInversorInvalido
    end
    @tipo = posibles_tipos[tipo]
  end

  def invertir(inversion)
    @inversiones.push(inversion)
  end

  def recaudar_ganancias_brutas()
    ganancias_brutas = 0
    @inversiones.each do |inversion|
      ganancias_brutas += inversion.obtener_ganancia()
    end
    @ganancias_brutas = ganancias_brutas
  end

  def obtener_impuesto_a_ganancia_de_inversion(impuesto)
    total_impuesto = impuesto.calcular_impuesto(self,@ganancias_brutas)
    return total_impuesto
  end

end
