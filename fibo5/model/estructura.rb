
class Estructura

  def self.sumatoria(arreglo)
    suma = 0;
    for i in 0...arreglo.length do
      suma += arreglo[i];
    end
    return suma;
  end

  def self.lista(arreglo)
    return arreglo;
  end

  def self.devolver_estructura(estructura, suma_lista)
    begin
      estructura_final = estructura
      if(suma_lista.nil? == false)
        metodo_a_llamar = method(suma_lista);
        estructura_final = metodo_a_llamar.call(estructura_final);
      end
      return estructura_final
    rescue
      halt 400
    end
  end

end
