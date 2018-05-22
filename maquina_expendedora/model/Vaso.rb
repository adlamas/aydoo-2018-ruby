require_relative '../model/Azucarero'
require_relative '../model/Cafetero'
require_relative '../model/Sustancia'

class Vaso
  attr_accessor :cantidad_de_azucar, :azucarero, :sustancias

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
    @cafetero.agregar_cafe(self)
  end

  def tiene_cafe?()
    @sustancias.each do |sustancia|
      if(sustancia.get_nombre_sustancia() == "cafe")
        return true
      end
    end
    return false;
  end

  def tiene_azucar?()
    return true;
  end

  def tiene_te?()
    return false;
  end

end
