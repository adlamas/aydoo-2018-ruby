
class Solo

  def self.pares(arreglo_pasado)
    arreglo_nuevo = Array.new()
    for i in 0...arreglo_pasado.length do
      if(arreglo_pasado[i] % 2 == 0 && arreglo_pasado[i] != 0)
        arreglo_nuevo.push(arreglo_pasado[i]);
      end
    end
    return arreglo_nuevo;
  end

  def self.impares(arreglo_pasado)
    arreglo_nuevo = Array.new()
    for i in 0...arreglo_pasado.length do
      if(arreglo_pasado[i] % 2 != 0 && arreglo_pasado[i] != 0)
        arreglo_nuevo.push(arreglo_pasado[i]);
      end
    end
    return arreglo_nuevo;
  end
end
