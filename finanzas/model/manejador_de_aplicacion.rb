require 'rspec'
require_relative 'compra_dolares'
require_relative 'impuesto'
require_relative 'inversion'
require_relative 'inversor'
require_relative '../excepciones/excepcion_inversion_no_existente'
require_relative 'constructor_de_inversor'
require_relative 'constructor_de_inversion'



class ManejadorDeAplicacion

  attr_accessor :constructor_de_inversion, :constructor_de_inversor
  def initialize
    @constructor_de_inversor = ConstructorDeInversor.new()
    @constructor_de_inversion = ConstructorDeInversion.new()
  end

  def devolver_inversor_con_inversiones_asignadas(parametros)
    inversor = @constructor_de_inversor.construir_inversor(parametros[0])
    for i in(1...parametros.length)
      inversor.invertir(@constructor_de_inversion.construir_inversion(parametros[i]))
    end
    return inversor
  end

end
