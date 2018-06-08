
class Sentido

  def self.dar_sentido_al_arreglo(arreglo_pasado, sentido)
    if(sentido == "inverso")
      return arreglo_pasado.reverse;
    elsif (sentido == "directo")
      return arreglo_pasado;
    else
      return halt 400, "{'error': 'Opciones no validas'}"
    end
  end

end
