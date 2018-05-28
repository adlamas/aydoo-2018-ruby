
class CalculoArreglo

  def initialize()
  end

  def calcular(numero)
    serie_fibo = [0,1]
    temporal = 0;
    numero1 = 0;
    numero2 = 1;

    for i in 2..(numero - 1) do
      temporal = numero1;
      numero1 = numero2;
      numero2 = temporal + numero1;
      serie_fibo[i] = numero2;
    end

    return serie_fibo;
  end

end
