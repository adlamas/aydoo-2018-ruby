require_relative "impuesto_a_empresa"
require_relative "impuesto_a_individuo"

class Impuesto
  attr_accessor :tipo_de_impuesto, :impuesto_a_empresa, :impuesto_a_individuo

  def initialize()
    @impuesto_a_empresa = ImpuestoAEmpresa.new()
    @impuesto_a_individuo = ImpuestoAIndividuo.new()
    @tipo_de_impuesto = {"individuo" => @impuesto_a_individuo, "empresa" => @impuesto_a_empresa}
  end

  def calcular_impuesto(tipo,ganancias_brutas)
    impuesto_a_ganancias = @tipo_de_impuesto[tipo].calcular_impuesto(ganancias_brutas)
    return impuesto_a_ganancias
  end

end
