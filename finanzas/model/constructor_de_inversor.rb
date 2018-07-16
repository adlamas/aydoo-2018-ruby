require_relative 'inversor'
class ConstructorDeInversor

  def initialize
  end

  def construir_inversor(inversor)
    inversor = Inversor.new(inversor)
    return inversor
  end

end
