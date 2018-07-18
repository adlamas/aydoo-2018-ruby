require_relative 'compra_dolares'

class ConstructorCompraDolares

  def initialize()
  end

  def crear_inversion(parametros)
    monto = parametros[0]
    cot_ini = parametros[1]
    cot_fin = parametros[2]
    compra_dolares = CompraDolares.new(monto,cot_ini,cot_fin)
    return compra_dolares
  end

end
