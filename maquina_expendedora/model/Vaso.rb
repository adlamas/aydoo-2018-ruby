require_relative '../model/Azucarero'
require_relative '../model/Cafetero'

class Vaso
  attr_accessor :cantidad_de_azucar

  def initialize()
    @cantidad_de_azucar = 0
    @azucarero = Azucarero.new
    @cafetero = Cafetero.new
    @sustancias = Array.new

  end

  def cantidad_de_azucar()
    return @cantidad_de_azucar
  end

  def agregar_azucar(azucar)
    @azucarero.agregar_azucar(self,azucar)
  end

  def agregar_cafe()

  end

  def tiene_cafe?()
    return true;
  end

  def tiene_azucar?()
    return true;
  end

  def tiene_te?()
    return false;
  end

end
