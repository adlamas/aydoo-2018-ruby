
class ImpuestoAEmpresa

  def calcular_impuesto(ganancias_brutas)
    tasas = {[0,19999.9999] => 0,[20000,49999.9999] => 5, [50000, 99999.9999] => 10, [100000, 499999.9999] => 15 ,
      [500000, Float::INFINITY] => 20}
    tasas.each do |key, value|
      if(ganancias_brutas.between?(key[0],key[1]))
          return ((ganancias_brutas * value)/100)
      end
    end
  end

end
