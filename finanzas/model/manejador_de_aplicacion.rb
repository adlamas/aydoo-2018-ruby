require 'rspec'
require_relative 'compra_dolares'
require_relative 'impuesto'
require_relative 'inversion'
require_relative 'inversor'
require_relative 'plazo_fijo_precancelable'
require_relative 'plazo_fijo'

class ManejadorDeAplicacion

  def initialize
  end

  def devolver_inversor(inversor, inversion)
    inversor = construir_inversor(inversor)
    return inversor
  end

  def construir_inversor(inversor)
    inversor = Inversor.new(inversor)
    return inversor
  end

  def construir_inversion(inversion)
  end

end
