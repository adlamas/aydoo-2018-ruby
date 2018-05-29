
class Sentido

  def self.dar_sentido_al_arreglo(arreglo_pasado, sentido)
    arreglo_nuevo = arreglo_pasado;
    if(sentido == "inverso")
      arreglo_nuevo = invertir(arreglo_pasado)
    elsif (sentido == "directo")
    else
      #tirar excepcion
    end

    return arreglo_nuevo;
  end

  def self.invertir(arreglo_pasado)
    numerosDescendentes = arreglo_pasado;
		for  i in 0...(numerosDescendentes.length - 1) do
			for  j in (i + 1)...numerosDescendentes.length do
        if (numerosDescendentes[i] < numerosDescendentes[j])
					auxiliar = numerosDescendentes[i];
					numerosDescendentes[i] = numerosDescendentes[j];
					numerosDescendentes[j] = auxiliar;
				end

			end

		end
		return numerosDescendentes;
  end

end
