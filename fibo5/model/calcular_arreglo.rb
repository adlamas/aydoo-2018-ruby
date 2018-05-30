require 'json'
require 'sinatra/json'

class CalculoArreglo

  def self.calcular(numero)

    numero_i = numero.to_i
    serie_fibo = Array.new()
    serie_fibo.push(0)
    serie_fibo.push(1);

    temporal = 0;
    numero1 = 0;
    numero2 = 1;


    for i in 2...(numero_i) do
      temporal = numero1;
      numero1 = numero2;
      numero2 = temporal + numero1;
      serie_fibo[i] = numero2;
    end


    return serie_fibo;
  end

end
