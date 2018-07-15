
class Impuesto
  attr_accessor :tasa, :inversor, :tipo_de_impuesto

  def initialize()
    @tasa = 0
    @tipo_de_impuesto = {"individuo" => "impuesto_a_individuo", "empresa" => "impuesto_a_empresa"}
  end

  def calcular_impuesto(inversor, ganancias_brutas)
    impuesto = send(@tipo_de_impuesto[inversor.tipo], ganancias_brutas)
    return impuesto
  end

  def impuesto_a_individuo(ganancias_brutas)
    tasas = {[0,49999.9999] => 0, [50000, 99999.9999] => 5, [100000, 499999.9999] => 8 ,
      [500000, Float::INFINITY] => 10}
    tasas.each do |key, value|
      if(ganancias_brutas.between?(key[0],key[1]))
        return ((ganancias_brutas * value)/100)
      end
    end
  end

  def impuesto_a_empresa(ganancias_brutas)
    tasas = {[0,19999.9999] => 0,[20000,49999.9999] => 5, [50000, 99999.9999] => 10, [100000, 499999.9999] => 15 ,
      [500000, Float::INFINITY] => 20}
    tasas.each do |key, value|
      if(ganancias_brutas.between?(key[0],key[1]))
          return ((ganancias_brutas * value)/100)
      end
    end
  end

end
