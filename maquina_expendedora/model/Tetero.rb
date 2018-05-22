require_relative '../model/Sustancia'

class Tetero
  def agregar_te(vaso)
    te = Sustancia.new("te")
    vaso.sustancias.push(te)
  end
end
