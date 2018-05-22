require_relative '../model/Azucarero'
require_relative '../model/Cafetero'
require_relative '../model/Sustancia'
require_relative '../model/Tetero'
require_relative '../model/Lechero'

class Vaso
  attr_accessor :cantidad_de_azucar, :azucarero, :sustancias, :tetero, :cafetero, :lechero

  def initialize()
    @cantidad_de_azucar = 0
    @azucarero = Azucarero.new
    @cafetero = Cafetero.new
    @tetero = Tetero.new
    @sustancias = Array.new
    @lechero = Lechero.new


  end

  def agregar_azucar(azucar)
    @azucarero.agregar_azucar(self,azucar)
  end

  def agregar_cafe()
    @cafetero.agregar_cafe(self)
  end

  def agregar_te
    @tetero.agregar_te(self)
  end

  def agregar_leche
    @lechero.agregar_leche(self)
  end

  def cantidad_de_azucar()
    return @cantidad_de_azucar
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
    if(@cantidad_de_azucar > 0)
      return true
    else
      return false
    end

  end

  def tiene_te?()
    @sustancias.each do |sustancia|
      if(sustancia.get_nombre_sustancia() == "te")
        return true
      end
    end
    return false;
  end

  def tiene_leche?()
    @sustancias.each do |sustancia|
      if(sustancia.get_nombre_sustancia() == "leche")
        return true
      end
    end
    return false;
  end

end
