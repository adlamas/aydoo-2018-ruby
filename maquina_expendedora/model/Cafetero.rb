require_relative '../model/Sustancia'

class Cafetero

  def agregar_cafe(vaso)
    cafe = Sustancia.new("cafe")
    vaso.sustancias.push(cafe)
  end

end
