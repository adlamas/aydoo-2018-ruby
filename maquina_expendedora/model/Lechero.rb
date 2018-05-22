
class Lechero

  def agregar_leche(vaso)
    leche = Sustancia.new("leche")
    vaso.sustancias.push(leche)
  end

end
