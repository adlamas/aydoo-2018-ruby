require_relative 'inversor'
class ConstructorDeInversor

  def initialize
  end

  def construir_inversor(tipo_inversor)
    inversor = Inversor.new(tipo_inversor)
    return inversor
  end

end
