
class Sumatoria

  def self.sumar(arreglo)
    suma = 0;
    for i in 0...arreglo.length do
      suma += arreglo[i];
    end
    
    return suma;
  end

end
