
class Solo

  def self.solo_estos_valores(arreglo_pasado, solo)
    arreglo_nuevo = arreglo_pasado
    if(solo == "pares")
      arreglo_nuevo = solo_valores_pares(arreglo_pasado)
    elsif (solo == "impares")
      arreglo_nuevo = solo_valores_impares(arreglo_pasado)
    else
      halt 400
    end

    return arreglo_nuevo;
  end

  def self.solo_valores_pares(arreglo_pasado)
    arreglo_nuevo = Array.new()
    for i in 0...arreglo_pasado.length do
      if(arreglo_pasado[i] % 2 == 0 && arreglo_pasado[i] != 0)
        arreglo_nuevo.push(arreglo_pasado[i]);
      end
    end
    return arreglo_nuevo;
  end

  def self.solo_valores_impares(arreglo_pasado)
    arreglo_nuevo = Array.new()
    for i in 0...arreglo_pasado.length do
      if(arreglo_pasado[i] % 2 != 0 && arreglo_pasado[i] != 0)
        arreglo_nuevo.push(arreglo_pasado[i]);
      end
    end
    return arreglo_nuevo;
  end
end
