require_relative "inversor"
class Impuesto
  attr_accessor :tasa, :inversor, :tipo_de_impuesto

  def initialize(inversor)
    @tasa = 0
    @inversor = inversor
    @tipo_de_impuesto = {"individuo" => "impuesto_a_individuo"}
  end

  def calcular_tasa()
    
    tasa = send(@tipo_de_impuesto[@inversor.tipo])
    return tasa
  end

  def impuesto_a_individuo(ganancias_brutas)
    tasas = {[0,49999.9999] => 0, [50000, 99999.9999] => 5, [100000, 499999.9999] => 8 ,
      [500000, Float::INFINITY] => 10}
    tasas.each do |key, value|
      if(ganancias_brutas.between?(key[0],key[1]))
        return value
      end
    end
  end
end
