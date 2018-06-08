
class Estructura

  def self.sumar(arreglo)
    suma = 0;
    for i in 0...arreglo.length do
      suma += arreglo[i];
    end
    return suma;
  end

  def self.devolver_estructura(estructura, suma_lista)
    if(suma_lista == "sumatoria")
      suma = sumar(estructura)
      return suma;
    else
      return estructura;
    end

  end

end
